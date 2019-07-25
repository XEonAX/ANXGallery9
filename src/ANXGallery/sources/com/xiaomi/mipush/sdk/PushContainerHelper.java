package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.android.DataCryptUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.string.Base64Coder;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.Target;
import com.xiaomi.xmpush.thrift.XmPushActionAckMessage;
import com.xiaomi.xmpush.thrift.XmPushActionAckNotification;
import com.xiaomi.xmpush.thrift.XmPushActionCommandResult;
import com.xiaomi.xmpush.thrift.XmPushActionContainer;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import com.xiaomi.xmpush.thrift.XmPushActionRegistrationResult;
import com.xiaomi.xmpush.thrift.XmPushActionSendFeedbackResult;
import com.xiaomi.xmpush.thrift.XmPushActionSendMessage;
import com.xiaomi.xmpush.thrift.XmPushActionSubscriptionResult;
import com.xiaomi.xmpush.thrift.XmPushActionUnRegistrationResult;
import com.xiaomi.xmpush.thrift.XmPushActionUnSubscriptionResult;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import java.nio.ByteBuffer;
import org.apache.thrift.TBase;
import org.apache.thrift.TException;

public class PushContainerHelper {
    private static TBase createRespMessageFromAction(ActionType actionType, boolean z) {
        switch (actionType) {
            case Registration:
                return new XmPushActionRegistrationResult();
            case UnRegistration:
                return new XmPushActionUnRegistrationResult();
            case Subscription:
                return new XmPushActionSubscriptionResult();
            case UnSubscription:
                return new XmPushActionUnSubscriptionResult();
            case SendMessage:
                return new XmPushActionSendMessage();
            case AckMessage:
                return new XmPushActionAckMessage();
            case SetConfig:
                return new XmPushActionCommandResult();
            case ReportFeedback:
                return new XmPushActionSendFeedbackResult();
            case Notification:
                if (z) {
                    return new XmPushActionNotification();
                }
                XmPushActionAckNotification xmPushActionAckNotification = new XmPushActionAckNotification();
                xmPushActionAckNotification.setErrorCodeIsSet(true);
                return xmPushActionAckNotification;
            case Command:
                return new XmPushActionCommandResult();
            default:
                return null;
        }
    }

    protected static <T extends TBase<T, ?>> XmPushActionContainer generateRequestContainer(Context context, T t, ActionType actionType) {
        return generateRequestContainer(context, t, actionType, !actionType.equals(ActionType.Registration), context.getPackageName(), AppInfoHolder.getInstance(context).getAppID());
    }

    protected static <T extends TBase<T, ?>> XmPushActionContainer generateRequestContainer(Context context, T t, ActionType actionType, boolean z, String str, String str2) {
        byte[] bArr;
        byte[] convertThriftObjectToBytes = XmPushThriftSerializeUtils.convertThriftObjectToBytes(t);
        if (convertThriftObjectToBytes == null) {
            MyLog.w("invoke convertThriftObjectToBytes method, return null.");
            return null;
        }
        XmPushActionContainer xmPushActionContainer = new XmPushActionContainer();
        if (z) {
            String regSecret = AppInfoHolder.getInstance(context).getRegSecret();
            if (TextUtils.isEmpty(regSecret)) {
                MyLog.w("regSecret is empty, return null");
                return null;
            }
            try {
                bArr = DataCryptUtils.mipushEncrypt(Base64Coder.decode(regSecret), convertThriftObjectToBytes);
            } catch (Exception unused) {
                MyLog.e("encryption error. ");
            }
            Target target = new Target();
            target.channelId = 5;
            target.userId = "fakeid";
            xmPushActionContainer.setTarget(target);
            xmPushActionContainer.setPushAction(ByteBuffer.wrap(bArr));
            xmPushActionContainer.setAction(actionType);
            xmPushActionContainer.setIsRequest(true);
            xmPushActionContainer.setPackageName(str);
            xmPushActionContainer.setEncryptAction(z);
            xmPushActionContainer.setAppid(str2);
            return xmPushActionContainer;
        }
        bArr = convertThriftObjectToBytes;
        Target target2 = new Target();
        target2.channelId = 5;
        target2.userId = "fakeid";
        xmPushActionContainer.setTarget(target2);
        xmPushActionContainer.setPushAction(ByteBuffer.wrap(bArr));
        xmPushActionContainer.setAction(actionType);
        xmPushActionContainer.setIsRequest(true);
        xmPushActionContainer.setPackageName(str);
        xmPushActionContainer.setEncryptAction(z);
        xmPushActionContainer.setAppid(str2);
        return xmPushActionContainer;
    }

    public static TBase getResponseMessageBodyFromContainer(Context context, XmPushActionContainer xmPushActionContainer) throws TException, DecryptException {
        byte[] bArr;
        if (xmPushActionContainer.isEncryptAction()) {
            try {
                bArr = DataCryptUtils.mipushDecrypt(Base64Coder.decode(AppInfoHolder.getInstance(context).getRegSecret()), xmPushActionContainer.getPushAction());
            } catch (Exception e) {
                throw new DecryptException("the aes decrypt failed.", e);
            }
        } else {
            bArr = xmPushActionContainer.getPushAction();
        }
        TBase createRespMessageFromAction = createRespMessageFromAction(xmPushActionContainer.getAction(), xmPushActionContainer.isRequest);
        if (createRespMessageFromAction != null) {
            XmPushThriftSerializeUtils.convertByteArrayToThriftObject(createRespMessageFromAction, bArr);
        }
        return createRespMessageFromAction;
    }
}
