package com.miui.gallery.people.mark;

import android.content.Context;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.people.mark.MarkPeopleSuggestionContract.LoadMarkSuggestionCallback;
import com.miui.gallery.people.mark.MarkPeopleSuggestionContract.MarkPeopleCallback;
import com.miui.gallery.people.mark.MarkPeopleSuggestionContract.Model;
import com.miui.gallery.people.mark.MarkPeopleSuggestionContract.View;
import com.miui.gallery.people.model.People;
import com.miui.gallery.util.GallerySamplingStatHelper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class MarkPeopleSuggestionPresenter {
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public Bundle mMarkInfo;
    /* access modifiers changed from: private */
    public Model mModel;
    /* access modifiers changed from: private */
    public ArrayList<People> mPeopleSuggestion;
    /* access modifiers changed from: private */
    public boolean mStopped = false;
    /* access modifiers changed from: private */
    public View mView;

    public MarkPeopleSuggestionPresenter(Context context, View view, Model model, Bundle bundle) {
        this.mContext = context;
        this.mView = view;
        this.mModel = model;
        this.mMarkInfo = bundle;
    }

    private int getMaxFaceCount(ArrayList<People> arrayList) {
        int i = 0;
        if (arrayList != null && arrayList.size() > 0) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                i = Math.max(((People) it.next()).getFaceCount(), i);
            }
        }
        return i;
    }

    /* access modifiers changed from: private */
    public void setMarkResult(boolean z, boolean z2) {
        this.mModel.setMarkResult(this.mMarkInfo, z);
        String str = z2 ? z ? "mark_myself_load_more_mark" : "mark_myself_load_more_close" : z ? "mark_myself_dialog_mark" : "mark_myself_dialog_close";
        HashMap hashMap = null;
        if (!z2 && this.mPeopleSuggestion != null) {
            hashMap = new HashMap(2);
            hashMap.put("PeopleCount", String.valueOf(this.mPeopleSuggestion.size()));
            int maxFaceCount = getMaxFaceCount(this.mPeopleSuggestion);
            String str2 = maxFaceCount <= 5 ? "1-5" : maxFaceCount <= 10 ? "6-10" : maxFaceCount <= 50 ? "11-50" : maxFaceCount <= 100 ? "51-100" : ">100";
            hashMap.put("MaxFaceCount", str2);
        }
        GallerySamplingStatHelper.recordCountEvent("people_mark", str, hashMap);
    }

    public void ignoreSuggestion() {
        if (this.mView.isSuggestionDialogVisible()) {
            this.mView.dismissSuggestionDialog();
        }
        this.mView.showInfoDialog(this.mContext.getString(R.string.set_group), this.mContext.getString(R.string.mark_people_ignore_info_message));
        setMarkResult(false, false);
        GallerySamplingStatHelper.recordCountEvent("people_mark", "mark_myself_dialog_close");
    }

    public void loadMore() {
        if (this.mView.isSuggestionDialogVisible()) {
            this.mView.dismissSuggestionDialog();
        }
        if (this.mPeopleSuggestion == null || this.mPeopleSuggestion.size() >= this.mMarkInfo.getInt("option_suggestion_limit")) {
            this.mView.goToActivity(MarkPeopleSuggestionContract.buildMarkUriForMarkInfo(this.mMarkInfo));
            GallerySamplingStatHelper.recordCountEvent("people_mark", "mark_myself_dialog_load_more");
            return;
        }
        GallerySamplingStatHelper.recordCountEvent("people_mark", "mark_myself_dialog_close");
    }

    public void markPeople(People people) {
        this.mView.dismissSuggestionDialog();
        this.mModel.markPeople(this.mContext, people, this.mMarkInfo, new MarkPeopleCallback() {
            public void onMarkPeopleFailed(String str) {
                if (!MarkPeopleSuggestionPresenter.this.mStopped) {
                    MarkPeopleSuggestionPresenter.this.mView.showMarkResult(false, str);
                }
                MarkPeopleSuggestionPresenter.this.setMarkResult(false, false);
            }

            public void onMarkPeopleSucceeded() {
                if (!MarkPeopleSuggestionPresenter.this.mStopped) {
                    MarkPeopleSuggestionPresenter.this.mView.showMarkResult(true, MarkPeopleSuggestionPresenter.this.mContext.getString(R.string.mark_operation_succeeded));
                }
                MarkPeopleSuggestionPresenter.this.setMarkResult(true, false);
            }
        });
    }

    public void setLoadMoreMarkResult(boolean z) {
        setMarkResult(z, true);
    }

    public void start() {
        this.mStopped = false;
        if ((this.mModel.needMark(this.mMarkInfo) && !this.mView.isSuggestionDialogVisible()) || this.mView.isSuggestionDialogVisible()) {
            this.mModel.loadMarkSuggestion(this.mContext, this.mMarkInfo, new LoadMarkSuggestionCallback() {
                public void onNoNeedMark() {
                    MarkPeopleSuggestionPresenter.this.mModel.onMarkSuggestionTriggered(MarkPeopleSuggestionPresenter.this.mMarkInfo);
                    MarkPeopleSuggestionPresenter.this.setMarkResult(true, false);
                }

                public void onPeopleSuggestionLoadFailed() {
                }

                public void onPeopleSuggestionLoaded(ArrayList<People> arrayList) {
                    if (!MarkPeopleSuggestionPresenter.this.mStopped && arrayList != null && !arrayList.isEmpty()) {
                        MarkPeopleSuggestionPresenter.this.mPeopleSuggestion = arrayList;
                        MarkPeopleSuggestionPresenter.this.mView.showSuggestionDialog(MarkPeopleSuggestionPresenter.this.mContext.getString(R.string.mark_myself_suggestion_title), MarkPeopleSuggestionPresenter.this.mContext.getString(R.string.mark_myself_suggestion_load_more), arrayList);
                        MarkPeopleSuggestionPresenter.this.mModel.onMarkSuggestionTriggered(MarkPeopleSuggestionPresenter.this.mMarkInfo);
                    }
                }
            });
        }
    }

    public void stop() {
        this.mStopped = true;
    }
}
