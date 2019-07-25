package com.miui.gallery.search.feedback;

import android.app.Activity;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.text.SpannableStringBuilder;
import android.text.method.LinkMovementMethod;
import com.miui.gallery.R;
import com.miui.gallery.preference.GalleryPreferences.Search;
import com.miui.gallery.text.UrlSpan;
import com.miui.gallery.text.UrlSpan.UrlSpanOnClickListener;
import com.miui.gallery.widget.GalleryDialogFragment;
import miui.app.AlertDialog.Builder;

public class FeedbackPolicyNoticeFragment extends GalleryDialogFragment {
    /* access modifiers changed from: private */
    public OnClickListener mPositiveClickListener;

    private SpannableStringBuilder buildUserNotice(final Activity activity, int i, int i2) {
        String string = activity.getString(i2);
        String string2 = activity.getString(i, new Object[]{string});
        AnonymousClass3 r0 = new UrlSpanOnClickListener() {
            public void onClick() {
                SearchFeedbackHelper.goToFeedbackPolicyPage(activity);
            }
        };
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(string2);
        int indexOf = string2.indexOf(string);
        spannableStringBuilder.setSpan(new UrlSpan(r0), indexOf, string.length() + indexOf, 33);
        return spannableStringBuilder;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setCancelable(false);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        return new Builder(getActivity()).setTitle(R.string.user_notice_title).setMessage(buildUserNotice(getActivity(), R.string.search_feedback_user_notice, R.string.search_feedback_user_policy)).setPositiveButton(R.string.user_agree, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                Search.setShouldShowFeedbackPolicy(!FeedbackPolicyNoticeFragment.this.getDialog().isChecked());
                if (FeedbackPolicyNoticeFragment.this.mPositiveClickListener != null) {
                    FeedbackPolicyNoticeFragment.this.mPositiveClickListener.onClick(dialogInterface, i);
                }
            }
        }).setNegativeButton(17039360, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                FeedbackPolicyNoticeFragment.this.getActivity().finish();
            }
        }).setCheckBox(true, getActivity().getString(R.string.do_not_remind_me)).create();
    }

    public void onStart() {
        super.onStart();
        getDialog().getMessageView().setMovementMethod(LinkMovementMethod.getInstance());
    }

    public void setOnPositiveButtonClickListener(OnClickListener onClickListener) {
        this.mPositiveClickListener = onClickListener;
    }
}
