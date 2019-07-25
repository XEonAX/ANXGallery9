package com.miui.gallery.people.mark;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import com.miui.gallery.R;
import com.miui.gallery.model.PeopleContactInfo;
import com.miui.gallery.model.PeopleContactInfo.Relation;
import com.miui.gallery.people.model.People;
import com.miui.gallery.provider.GalleryContract.Common;
import java.util.ArrayList;

public class MarkPeopleSuggestionContract {

    public interface LoadMarkSuggestionCallback {
        void onNoNeedMark();

        void onPeopleSuggestionLoadFailed();

        void onPeopleSuggestionLoaded(ArrayList<People> arrayList);
    }

    public interface MarkPeopleCallback {
        void onMarkPeopleFailed(String str);

        void onMarkPeopleSucceeded();
    }

    public interface Model {
        void loadMarkSuggestion(Context context, Bundle bundle, LoadMarkSuggestionCallback loadMarkSuggestionCallback);

        void markPeople(Context context, People people, Bundle bundle, MarkPeopleCallback markPeopleCallback);

        boolean needMark(Bundle bundle);

        void onMarkSuggestionTriggered(Bundle bundle);

        void setMarkResult(Bundle bundle, boolean z);
    }

    public interface View {
        void dismissSuggestionDialog();

        void goToActivity(Uri uri);

        boolean isSuggestionDialogVisible();

        void showInfoDialog(String str, String str2);

        void showMarkResult(boolean z, String str);

        void showSuggestionDialog(String str, String str2, ArrayList<People> arrayList);
    }

    public static Bundle buildMarkInfoForMarkMyself(Context context) {
        Bundle bundle = new Bundle();
        bundle.putString("option_mark_relation", PeopleContactInfo.getRelationValue(Relation.myself));
        bundle.putInt("option_suggestion_limit", context.getResources().getInteger(R.integer.mark_people_suggestion_limit));
        return bundle;
    }

    public static Uri buildMarkUriForMarkInfo(Bundle bundle) {
        return Common.URI_PEOPLE_LIST_PAGE.buildUpon().appendQueryParameter("markMode", "true").appendQueryParameter("markRelation", bundle.getString("option_mark_relation")).build();
    }
}
