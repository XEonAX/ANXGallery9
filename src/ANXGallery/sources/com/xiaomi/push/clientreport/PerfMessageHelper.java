package com.xiaomi.push.clientreport;

import android.content.Context;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.clientReport.PushClientReportHelper;
import com.xiaomi.push.service.clientReport.PushClientReportManager;
import com.xiaomi.push.service.xmpush.Command;
import com.xiaomi.smack.util.TrafficUtils;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.NotificationType;
import com.xiaomi.xmpush.thrift.XmPushActionAckNotification;
import com.xiaomi.xmpush.thrift.XmPushActionCommand;
import com.xiaomi.xmpush.thrift.XmPushActionCommandResult;
import com.xiaomi.xmpush.thrift.XmPushActionContainer;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import com.xiaomi.xmpush.thrift.XmPushThriftSerializeUtils;
import org.apache.thrift.TBase;
import org.apache.thrift.TException;

public class PerfMessageHelper {
    public static void collectPerfData(String str, Context context, int i, int i2) {
        if (i > 0 && i2 > 0) {
            int traffic = getTraffic(context, i2);
            if (i != PushClientReportHelper.changeOrdinalToCode(NotificationType.UploadTinyData)) {
                PushClientReportManager.getInstance(context.getApplicationContext()).reportPerf(str, i, 1, (long) traffic);
            }
        }
    }

    public static void collectPerfData(String str, Context context, TBase tBase, ActionType actionType, int i) {
        collectPerfData(str, context, getMessageType(tBase, actionType), i);
    }

    public static void collectUpStream(String str, Context context, XmPushActionContainer xmPushActionContainer, int i) {
        if (context != null && xmPushActionContainer != null) {
            ActionType action = xmPushActionContainer.getAction();
            if (action != null) {
                int typeToCode = typeToCode(action);
                if (i <= 0) {
                    byte[] convertThriftObjectToBytes = XmPushThriftSerializeUtils.convertThriftObjectToBytes(xmPushActionContainer);
                    i = convertThriftObjectToBytes != null ? convertThriftObjectToBytes.length : 0;
                }
                collectPerfData(str, context, typeToCode, i);
            }
        }
    }

    public static void collectUpStream(String str, Context context, byte[] bArr) {
        if (context != null && bArr != null && bArr.length > 0) {
            XmPushActionContainer xmPushActionContainer = new XmPushActionContainer();
            try {
                XmPushThriftSerializeUtils.convertByteArrayToThriftObject(xmPushActionContainer, bArr);
                collectUpStream(str, context, xmPushActionContainer, bArr.length);
            } catch (TException unused) {
                MyLog.w("fail to convert bytes to container");
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0033, code lost:
        r2 = r3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:?, code lost:
        return r2;
     */
    public static int getMessageType(TBase tBase, ActionType actionType) {
        int changeValueToCode;
        int changeOrdinalToCode;
        switch (actionType) {
            case Registration:
            case UnRegistration:
            case Subscription:
            case UnSubscription:
            case SendMessage:
            case AckMessage:
            case SetConfig:
            case ReportFeedback:
            case MultiConnectionBroadcast:
            case MultiConnectionResult:
                return PushClientReportHelper.changeValueToCode(actionType.getValue());
            case Notification:
                changeValueToCode = PushClientReportHelper.changeValueToCode(actionType.getValue());
                if (tBase != null) {
                    try {
                        if (tBase instanceof XmPushActionAckNotification) {
                            String str = ((XmPushActionAckNotification) tBase).type;
                            if (!TextUtils.isEmpty(str) && PushClientReportHelper.changeOrdinalToCode(PushClientReportHelper.changeValueToNotificationType(str)) != -1) {
                                changeOrdinalToCode = PushClientReportHelper.changeOrdinalToCode(PushClientReportHelper.changeValueToNotificationType(str));
                                break;
                            }
                        } else if (tBase instanceof XmPushActionNotification) {
                            String str2 = ((XmPushActionNotification) tBase).type;
                            if (!TextUtils.isEmpty(str2)) {
                                if (PushClientReportHelper.changeOrdinalToCode(PushClientReportHelper.changeValueToNotificationType(str2)) != -1) {
                                    changeValueToCode = PushClientReportHelper.changeOrdinalToCode(PushClientReportHelper.changeValueToNotificationType(str2));
                                }
                                if (NotificationType.UploadTinyData.equals(PushClientReportHelper.changeValueToNotificationType(str2))) {
                                    return -1;
                                }
                            }
                        }
                    } catch (Exception unused) {
                        int i = changeValueToCode;
                        MyLog.e("PERF_ERROR : parse Notification type error");
                        return i;
                    }
                }
                break;
            case Command:
                changeValueToCode = PushClientReportHelper.changeValueToCode(actionType.getValue());
                if (tBase != null) {
                    try {
                        if (!(tBase instanceof XmPushActionCommandResult)) {
                            if (tBase instanceof XmPushActionCommand) {
                                String cmdName = ((XmPushActionCommand) tBase).getCmdName();
                                if (!TextUtils.isEmpty(cmdName) && Command.getCode(cmdName) != -1) {
                                    changeOrdinalToCode = Command.getCode(cmdName);
                                    break;
                                }
                            }
                        } else {
                            String cmdName2 = ((XmPushActionCommandResult) tBase).getCmdName();
                            if (!TextUtils.isEmpty(cmdName2) && Command.getCode(cmdName2) != -1) {
                                changeOrdinalToCode = Command.getCode(cmdName2);
                                break;
                            }
                        }
                    } catch (Exception unused2) {
                        MyLog.e("PERF_ERROR : parse Command type error");
                        break;
                    }
                }
                break;
            default:
                return -1;
        }
        return changeValueToCode;
    }

    public static int getTraffic(Context context, int i) {
        int networkType = TrafficUtils.getNetworkType(context);
        if (-1 == networkType) {
            return -1;
        }
        return (i * (networkType == 0 ? 13 : 11)) / 10;
    }

    public static int typeToCode(ActionType actionType) {
        return PushClientReportHelper.changeValueToCode(actionType.getValue());
    }
}
