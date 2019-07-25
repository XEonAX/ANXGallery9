package com.miui.gallery.search.feedback;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import com.google.gson.annotations.SerializedName;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.cloud.HostManager;
import com.miui.gallery.cloudcontrol.CloudControlManager;
import com.miui.gallery.cloudcontrol.FeatureProfile.Status;
import com.miui.gallery.net.base.RequestError;
import com.miui.gallery.preference.GalleryPreferences.Search;
import com.miui.gallery.provider.GalleryContract.Common;
import com.miui.gallery.search.core.source.server.ServerSearchRequest;
import com.miui.gallery.search.core.source.server.ServerSearchRequest.Builder;
import com.miui.gallery.search.utils.SearchLog;
import com.miui.gallery.search.utils.SearchUtils;
import com.miui.gallery.ui.ProcessTask;
import com.miui.gallery.ui.ProcessTask.OnCompleteListener;
import com.miui.gallery.ui.ProcessTask.ProcessCallback;
import com.miui.gallery.util.ActionURIHandler;
import com.miui.gallery.util.PrivacyAgreementUtils;
import com.miui.gallery.util.ToastUtils;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import miui.app.AlertDialog;

public class SearchFeedbackHelper {
    private static boolean CAN_USE_CACHE = false;
    private static final String LANGUAGE_CH = "cn";
    private static final String LANGUAGE_EH = "en";

    private static class FeedbackReportResponseData {
        @SerializedName("failureImageId")
        public Set<Long> failureImageIds;

        private FeedbackReportResponseData() {
        }
    }

    private static class FeedbackTaskResponseData {
        @SerializedName("awardInfo")
        public String awardInfo = null;
        @SerializedName("finishImageNum")
        public int finishImageNum = 0;
        @SerializedName("needHandleImageNum")
        public int needHandleImageNum = 0;

        private FeedbackTaskResponseData() {
        }
    }

    private enum FeedbackType {
        FALSE_POSITIVE("FP"),
        FALSE_NEGATIVE("FN");
        
        private String mValue;

        private FeedbackType(String str) {
            this.mValue = str;
        }

        public String getValue() {
            return this.mValue;
        }
    }

    public interface OnFeedbackCompleteListener {
        void onComplete(int i);
    }

    private static void addFeedbackReportedTag(String str) {
        if (!TextUtils.isEmpty(str)) {
            String feedbackReportedTags = Search.getFeedbackReportedTags();
            if (!TextUtils.isEmpty(str)) {
                StringBuilder sb = new StringBuilder();
                sb.append(feedbackReportedTags);
                sb.append(",");
                sb.append(str);
                str = sb.toString();
            }
            Search.setFeedbackReportedTags(str);
        }
    }

    private static String getFeedbackDialogText(Context context, String str, FeedbackType feedbackType) {
        int i;
        switch (feedbackType) {
            case FALSE_POSITIVE:
                i = R.string.search_feedback_false_positive_text;
                break;
            case FALSE_NEGATIVE:
                i = R.string.search_feedback_false_negative_text;
                break;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Invalid feedback type ");
                sb.append(feedbackType.getValue());
                throw new IllegalArgumentException(sb.toString());
        }
        return context.getString(i, new Object[]{str});
    }

    /* access modifiers changed from: private */
    public static String getFeedbackResultText(Context context, String str, FeedbackType feedbackType, int i, boolean z) {
        int i2;
        if (i > 0) {
            switch (feedbackType) {
                case FALSE_POSITIVE:
                    if (!z) {
                        i2 = R.plurals.search_feedback_done_mark_false_positive;
                        break;
                    } else {
                        i2 = R.plurals.search_feedback_done_mark_and_contribute_false_positive;
                        break;
                    }
                case FALSE_NEGATIVE:
                    if (!z) {
                        i2 = R.plurals.search_feedback_done_mark_false_negative;
                        break;
                    } else {
                        i2 = R.plurals.search_feedback_done_mark_and_contribute_false_negative;
                        break;
                    }
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("Invalid feedback type ");
                    sb.append(feedbackType.getValue());
                    throw new IllegalArgumentException(sb.toString());
            }
            return context.getResources().getQuantityString(i2, i, new Object[]{Integer.valueOf(i), str});
        }
        switch (feedbackType) {
            case FALSE_POSITIVE:
                return context.getString(R.string.search_failed_mark_feedback_false_positive);
            case FALSE_NEGATIVE:
                return context.getString(R.string.search_failed_mark_feedback_false_negative);
            default:
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Invalid feedback type ");
                sb2.append(feedbackType.getValue());
                throw new IllegalArgumentException(sb2.toString());
        }
    }

    public static Bundle getFeedbackTaskInfo() {
        String xiaomiId = SearchUtils.getXiaomiId();
        if (xiaomiId == null) {
            SearchLog.d("SearchFeedbackHelper", "Not logged in!");
            return null;
        } else if (!PrivacyAgreementUtils.isCloudServiceAgreementEnable(GalleryApp.sGetAndroidContext())) {
            SearchLog.d("SearchFeedbackHelper", "Cloud privacy agreement denied");
            return null;
        } else {
            ServerSearchRequest build = new Builder().setQueryPathPrefix(HostManager.Search.getSearchFeedbackUrlHost()).setUserPath(Builder.getDefaultUserPath(xiaomiId)).setUserId(xiaomiId).setQueryAppendPath("tag/feedback/task/num").setResultDataType(FeedbackTaskResponseData.class).setUseCache(CAN_USE_CACHE).build();
            try {
                Object[] executeSync = build.executeSync();
                if (executeSync != null && executeSync.length > 0 && (executeSync[0] instanceof FeedbackTaskResponseData)) {
                    FeedbackTaskResponseData feedbackTaskResponseData = (FeedbackTaskResponseData) executeSync[0];
                    Bundle bundle = new Bundle();
                    bundle.putInt("need_handle_image_num", feedbackTaskResponseData.needHandleImageNum);
                    bundle.putInt("finish_image_num", feedbackTaskResponseData.finishImageNum);
                    if (!TextUtils.isEmpty(feedbackTaskResponseData.awardInfo)) {
                        bundle.putString("task_award_info", feedbackTaskResponseData.awardInfo);
                    }
                    build.setCacheExpires(300000);
                    CAN_USE_CACHE = true;
                    return bundle;
                }
            } catch (RequestError e) {
                SearchLog.e("SearchFeedbackHelper", "Querying feedback info failed, %s", e);
            }
            SearchLog.e("SearchFeedbackHelper", "Empty feedback task info");
            return null;
        }
    }

    public static void goToFeedbackPolicyPage(Activity activity) {
        String str = "https://i.mi.com/static2?filename=MicloudWebBill/event/gallery/privacy/%s.html";
        Object[] objArr = new Object[1];
        objArr[0] = Locale.getDefault().getLanguage().equals("zh") ? LANGUAGE_CH : LANGUAGE_EH;
        goToHybridPage(activity, String.format(str, objArr));
    }

    private static void goToHybridPage(Activity activity, String str) {
        ActionURIHandler.handleUri(activity, Common.URI_HYBRID_PAGE.buildUpon().appendQueryParameter("url", str).build());
    }

    private static boolean hasReportedTag(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        String feedbackReportedTags = Search.getFeedbackReportedTags();
        if (!TextUtils.isEmpty(feedbackReportedTags)) {
            for (String equals : feedbackReportedTags.split(",")) {
                if (str.equals(equals)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean needToQueryLikelyImagesForFeedbackTask(String str) {
        return !hasReportedTag(str);
    }

    /* access modifiers changed from: private */
    public static int reportFalseImages(String str, List<String> list, FeedbackType feedbackType, boolean z) {
        if (TextUtils.isEmpty(str) || list == null || list.isEmpty()) {
            SearchLog.d("SearchFeedbackHelper", "Invalid false image params!");
            return 0;
        }
        String xiaomiId = SearchUtils.getXiaomiId();
        if (xiaomiId == null) {
            SearchLog.d("SearchFeedbackHelper", "Not logged in!");
            return 0;
        }
        int i = 0;
        int i2 = 0;
        while (i < list.size()) {
            int min = Math.min(list.size(), i + 10);
            i2 += reportFalseImagesBatch(xiaomiId, str, list.subList(i, min), feedbackType, z);
            i = min;
        }
        if (i2 > 0) {
            CAN_USE_CACHE = false;
            if (feedbackType.equals(FeedbackType.FALSE_NEGATIVE)) {
                addFeedbackReportedTag(str);
            }
        }
        return i2;
    }

    private static int reportFalseImagesBatch(String str, String str2, List<String> list, FeedbackType feedbackType, boolean z) {
        if (!PrivacyAgreementUtils.isCloudServiceAgreementEnable(GalleryApp.sGetAndroidContext())) {
            SearchLog.d("SearchFeedbackHelper", "Cloud privacy agreement denied");
            return 0;
        }
        int size = list.size();
        String join = TextUtils.join(",", list);
        SearchLog.d("SearchFeedbackHelper", "Reporting false image info [%s: %s: %s]", feedbackType, str2, list);
        try {
            Object[] executeSync = new Builder().setQueryPathPrefix(HostManager.Search.getSearchFeedbackUrlHost()).setQueryAppendPath("tag/feedback").setUserPath(Builder.getDefaultUserPath(str)).setMethod(1002).setUserId(str).setResultDataType(FeedbackReportResponseData.class).addQueryParam("feedbackType", feedbackType.getValue()).addQueryParam("tagName", str2).addQueryParam("imageIds", join).addQueryParam("isDonate", String.valueOf(z)).build().executeSync();
            if (executeSync != null && executeSync.length > 0 && (executeSync[0] instanceof FeedbackReportResponseData)) {
                FeedbackReportResponseData feedbackReportResponseData = (FeedbackReportResponseData) executeSync[0];
                if (feedbackReportResponseData.failureImageIds != null) {
                    SearchLog.d("SearchFeedbackHelper", "[%s] report failed!", feedbackReportResponseData.failureImageIds);
                    return size - feedbackReportResponseData.failureImageIds.size();
                }
            }
            SearchLog.d("SearchFeedbackHelper", "Done report batch!");
            return size;
        } catch (RequestError e) {
            SearchLog.e("SearchFeedbackHelper", "On report batch error! %s", e);
            return 0;
        }
    }

    public static void reportFalseNegativeImages(Activity activity, String str, boolean z, ArrayList<String> arrayList, OnFeedbackCompleteListener onFeedbackCompleteListener) {
        reportInDialog(activity, str, z, arrayList, FeedbackType.FALSE_NEGATIVE, onFeedbackCompleteListener);
    }

    public static void reportFalsePositiveImages(Activity activity, String str, boolean z, ArrayList<String> arrayList, OnFeedbackCompleteListener onFeedbackCompleteListener) {
        reportInDialog(activity, str, z, arrayList, FeedbackType.FALSE_POSITIVE, onFeedbackCompleteListener);
    }

    private static void reportInDialog(Activity activity, String str, boolean z, ArrayList<String> arrayList, FeedbackType feedbackType, OnFeedbackCompleteListener onFeedbackCompleteListener) {
        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        if (z || supportFeedbackTask()) {
            builder.setCheckBox(z, activity.getString(R.string.search_feedback_contribute));
        }
        AlertDialog.Builder title = builder.setTitle(getFeedbackDialogText(activity, str, feedbackType));
        final String str2 = str;
        final ArrayList<String> arrayList2 = arrayList;
        final FeedbackType feedbackType2 = feedbackType;
        final Activity activity2 = activity;
        final OnFeedbackCompleteListener onFeedbackCompleteListener2 = onFeedbackCompleteListener;
        AnonymousClass1 r2 = new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                final boolean isChecked = ((AlertDialog) dialogInterface).isChecked();
                ProcessTask processTask = new ProcessTask(new ProcessCallback<Void, Integer>() {
                    public Integer doProcess(Void[] voidArr) {
                        return Integer.valueOf(SearchFeedbackHelper.reportFalseImages(str2, arrayList2, feedbackType2, isChecked));
                    }
                });
                processTask.setCompleteListener(new OnCompleteListener() {
                    public void onCompleteProcess(Object obj) {
                        int intValue = obj == null ? 0 : ((Integer) obj).intValue();
                        ToastUtils.makeText((Context) activity2, (CharSequence) SearchFeedbackHelper.getFeedbackResultText(activity2, str2, feedbackType2, intValue, isChecked));
                        if (onFeedbackCompleteListener2 != null) {
                            onFeedbackCompleteListener2.onComplete(intValue);
                        }
                    }
                });
                processTask.showProgress(activity2, activity2.getString(R.string.operation_in_process));
                processTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
            }
        };
        title.setPositiveButton(R.string.ok, r2).setNegativeButton(R.string.cancel, null);
        try {
            builder.create().show();
        } catch (IllegalStateException e) {
            SearchLog.w("SearchFeedbackHelper", "Ignore exception: %s", e);
        }
    }

    public static boolean supportFeedbackTask() {
        return CloudControlManager.getInstance().queryFeatureStatus("search-feedback-task") == Status.ENABLE;
    }
}
