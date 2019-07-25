package com.miui.gallery.ui;

import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.search.feedback.SearchFeedbackHelper;
import com.miui.gallery.search.utils.SearchLog;
import miui.app.Fragment;

public class SearchFeedbackTaskController {
    private Fragment mFragment;
    private View mIndicator;
    private TextView mProgress;
    /* access modifiers changed from: private */
    public boolean mResumed;
    /* access modifiers changed from: private */
    public int mTaskStatus = -1;

    private class FeedbackInfoQueryTask extends AsyncTask<Void, Void, Bundle> {
        private FeedbackInfoQueryTask() {
        }

        /* access modifiers changed from: protected */
        public Bundle doInBackground(Void... voidArr) {
            try {
                Bundle feedbackTaskInfo = SearchFeedbackHelper.getFeedbackTaskInfo();
                if (feedbackTaskInfo != null) {
                    if (feedbackTaskInfo != Bundle.EMPTY) {
                        feedbackTaskInfo.putInt("task_status", SearchFeedbackTaskController.this.getFeedbackTaskStatus(feedbackTaskInfo.getInt("need_handle_image_num", 0), feedbackTaskInfo.getInt("finish_image_num", 0)));
                        return feedbackTaskInfo;
                    }
                }
                return null;
            } catch (Exception unused) {
                SearchLog.e("SearchFeedbackTaskController", "getFeedbackTaskInfo failed");
                return null;
            }
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Bundle bundle) {
            SearchLog.e("SearchFeedbackTaskController", "On get bundle %s, resumed %s", bundle, String.valueOf(SearchFeedbackTaskController.this.mResumed));
            if (SearchFeedbackTaskController.this.mResumed && bundle != null) {
                int i = bundle.getInt("need_handle_image_num", 0);
                int i2 = bundle.getInt("finish_image_num", 0);
                SearchFeedbackTaskController.this.mTaskStatus = bundle.getInt("task_status", -1);
                SearchFeedbackTaskController.this.updateIndicatorUI(i, i2);
            } else if (bundle == null) {
                SearchFeedbackTaskController.this.hideIndicator();
            }
        }
    }

    public SearchFeedbackTaskController(Fragment fragment, View view) {
        this.mFragment = fragment;
        this.mIndicator = view;
        this.mProgress = (TextView) this.mIndicator.findViewById(R.id.feedback_task_progress);
        this.mIndicator.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
            }
        });
        hideIndicator();
    }

    /* access modifiers changed from: private */
    public int getFeedbackTaskStatus(int i, int i2) {
        if (i <= 0) {
            SearchLog.w("SearchFeedbackTaskController", "Something wrong may happened, invalid feedback task num");
            return -1;
        }
        return i2 >= i ? 1 : 0;
    }

    /* access modifiers changed from: private */
    public void hideIndicator() {
        this.mIndicator.setVisibility(8);
    }

    /* access modifiers changed from: private */
    public void updateIndicatorUI(int i, int i2) {
        if (this.mTaskStatus < 0) {
            hideIndicator();
            return;
        }
        this.mIndicator.setVisibility(0);
        switch (this.mTaskStatus) {
            case 0:
                this.mProgress.setText(String.format(this.mFragment.getString(R.string.search_feedback_task_progress), new Object[]{Integer.valueOf(i2), Integer.valueOf(i)}));
                break;
            case 1:
                this.mProgress.setText(R.string.search_feedback_task_complete);
                break;
            default:
                hideIndicator();
                break;
        }
    }

    public void onPause() {
        this.mResumed = false;
    }

    public void onResume() {
        this.mResumed = true;
        new FeedbackInfoQueryTask().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Void[0]);
    }
}
