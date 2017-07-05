package cn.sky_data.storeData.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.Serializable;
import java.util.OptionalInt;
import java.util.Properties;

/**
 * Created by chenhaonee on 2017/5/5.
 */
public class PropertiesManage implements Serializable {
    private String applicationPropertiesPath;

    private Properties applicationProperties;

    private final static Logger logger = LoggerFactory.getLogger(PropertiesManage.class);

    private Properties systemProperties;

    public static PropertiesManage propertiesManage = new PropertiesManage();

    public static PropertiesManage getInstance() {
        if (propertiesManage == null)
            logger.error("PropertiesManage init failed");
        else
            logger.debug("PropertiesManage init success");
        return propertiesManage;
    }

    private PropertiesManage() {
        systemProperties = new MyProperties();
        try {
            systemProperties.load(PropertiesManage.class.getClassLoader().getResourceAsStream("system.properties"));
            String runModel = systemProperties.getProperty("run_model");
            switch (runModel) {
                case "dev":
                    applicationPropertiesPath = "application-dev.properties";
                    break;
                default:
                    applicationPropertiesPath = "application.properties";
                    break;
            }
            applicationProperties = new MyProperties();
            applicationProperties.load(PropertiesManage.class.getClassLoader().getResourceAsStream(applicationPropertiesPath));
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(0);
        }

    }

    public String getPropertyAsString(String key) {
        return applicationProperties.getProperty(key);
    }

    public String[] getPropertyAsStringArray(String key) {
        return applicationProperties.getProperty(key).split(",");
    }

    public OptionalInt getPropertyAsInt(String key) {
        String rawValue = applicationProperties.getProperty(key);
        OptionalInt optionalInt = OptionalInt.empty();
        if (rawValue != null) {
            try {
                int value = Integer.parseInt(rawValue);
                optionalInt = OptionalInt.of(value);
            } catch (NumberFormatException e) {
                propertyTypeError(key);
            }
        } else
            propertyMissing(key);
        return optionalInt;
    }

    public boolean getPropertyAsBoolean(String key) {
        return Boolean.parseBoolean(applicationProperties.getProperty(key));
    }

    private void propertyMissing(String key) {
        logger.error(key + " is missing!");
        System.exit(0);
    }

    private void propertyTypeError(String key) {
        logger.error(key + " is missing!");
    }
}
