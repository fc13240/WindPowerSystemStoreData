package cn.sky_data.storeData.util;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by chenhaonee on 2017/4/15.
 */
public class ByteUtil {

    public static long bytes2long(byte[] b) {
        long value = 0;
        for (int i = 0; i < b.length; i++) {
            value += ((long) b[i] & 0xffL) << (8 * i);
        }
        return value;
    }

    /**
     * 修改自InputStream的read方法
     * 区别：本处，如果读到-1，直接返回-1，而不是返回已经读到的部分
     *
     * @param stream
     * @param b
     * @param off
     * @param len
     * @return
     * @throws IOException
     */
    public static int read(InputStream stream, byte b[], int off, int len) throws IOException {
        byte[] origin = b.clone();
        if (b == null) {
            throw new NullPointerException();
        } else if (off < 0 || len < 0 || len > b.length - off) {
            throw new IndexOutOfBoundsException();
        } else if (len == 0) {
            return 0;
        }

        int c = stream.read();
        if (c == -1) {
            return -1;
        }
        b[off] = (byte) c;

        int i = 1;
        try {
            for (; i < len; i++) {
                c = stream.read();
                if (c == -1) {
                    b = origin;
                    return -1;
                }
                b[off + i] = (byte) c;
            }
        } catch (IOException ee) {
        }
        return i;
    }
}
