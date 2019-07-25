package com.xiaomi.xmpush.thrift;

import android.content.Context;
import com.xiaomi.channel.commonutils.android.AppInfoUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.MobileStatusUtils;
import org.apache.thrift.TBase;
import org.apache.thrift.TDeserializer;
import org.apache.thrift.TException;
import org.apache.thrift.TSerializer;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.XmPushTBinaryProtocol.Factory;

public class XmPushThriftSerializeUtils {
    public static <T extends TBase<T, ?>> void convertByteArrayToThriftObject(T t, byte[] bArr) throws TException {
        if (bArr != null) {
            new TDeserializer(new Factory(true, true, bArr.length)).deserialize(t, bArr);
            return;
        }
        throw new TException("the message byte is empty.");
    }

    public static <T extends TBase<T, ?>> byte[] convertThriftObjectToBytes(T t) {
        if (t == null) {
            return null;
        }
        try {
            return new TSerializer(new TBinaryProtocol.Factory()).serialize(t);
        } catch (TException e) {
            MyLog.e("convertThriftObjectToBytes catch TException.", e);
            return null;
        }
    }

    public static short getDeviceStatus(Context context, XmPushActionContainer xmPushActionContainer) {
        int i = 0;
        int value = AppInfoUtils.getAppNotificationOp(context, xmPushActionContainer.packageName).getValue() + 0 + (MobileStatusUtils.isCharging(context) ? 4 : 0);
        if (MobileStatusUtils.isScreenLocked(context)) {
            i = 8;
        }
        return (short) (value + i);
    }
}
