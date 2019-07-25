package com.miui.gallery.people.mark;

import android.content.Context;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Pair;
import com.miui.gallery.R;
import com.miui.gallery.model.PeopleContactInfo;
import com.miui.gallery.model.PeopleContactInfo.Relation;
import com.miui.gallery.people.mark.MarkPeopleSuggestionContract.LoadMarkSuggestionCallback;
import com.miui.gallery.people.mark.MarkPeopleSuggestionContract.MarkPeopleCallback;
import com.miui.gallery.people.mark.MarkPeopleSuggestionContract.Model;
import com.miui.gallery.people.model.People;
import com.miui.gallery.preference.GalleryPreferences.Face;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.provider.deprecated.NormalPeopleFaceMediaSet;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.face.PeopleCursorHelper;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;

public class MarkMyselfSuggestionModel implements Model {

    private static class LoadPeopleTask extends AsyncTask<Void, Void, Pair<Integer, ArrayList<People>>> {
        private final int RT_INVALID = 0;
        private final int RT_NORMAL = 1;
        private final int RT_NO_NEED_MARK = 2;
        private LoadMarkSuggestionCallback mCallback;
        private WeakReference<Context> mContextRef;
        /* access modifiers changed from: private */
        public Bundle mMarkInfo;

        public LoadPeopleTask(Context context, Bundle bundle, LoadMarkSuggestionCallback loadMarkSuggestionCallback) {
            this.mContextRef = new WeakReference<>(context);
            this.mMarkInfo = bundle;
            this.mCallback = loadMarkSuggestionCallback;
        }

        /* access modifiers changed from: private */
        public int getPeopleTypePriorityForMyself(People people, String str) {
            if (Relation.myself == PeopleContactInfo.getRelation(people.getRelationType())) {
                return 0;
            }
            return (str == null || !str.equalsIgnoreCase(people.getName())) ? 2 : 1;
        }

        /* access modifiers changed from: protected */
        public Pair<Integer, ArrayList<People>> doInBackground(Void... voidArr) {
            final Context context = (Context) this.mContextRef.get();
            if (context == null) {
                return null;
            }
            return (Pair) SafeDBUtil.safeQuery(context, PeopleFace.PERSONS_URI, PeopleCursorHelper.PROJECTION, (String) null, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Pair<Integer, ArrayList<People>>>() {
                public Pair<Integer, ArrayList<People>> handle(Cursor cursor) {
                    ArrayList arrayList;
                    HashMap hashMap = new HashMap();
                    int i = 1;
                    if (cursor == null || !cursor.moveToFirst()) {
                        arrayList = null;
                    } else {
                        final String defaultNameForMyself = PeopleContactInfo.getDefaultNameForMyself(context);
                        arrayList = new ArrayList(cursor.getCount());
                        int i2 = 0;
                        int i3 = 0;
                        do {
                            int relationType = PeopleCursorHelper.getRelationType(cursor);
                            if (relationType != Relation.child.getRelationType()) {
                                People people = PeopleCursorHelper.toPeople(cursor);
                                arrayList.add(people);
                                if (relationType == Relation.myself.getRelationType()) {
                                    i2++;
                                }
                                if (defaultNameForMyself.equalsIgnoreCase(people.getName())) {
                                    i3++;
                                }
                            }
                        } while (cursor.moveToNext());
                        if (i2 == 1) {
                            i = 2;
                            hashMap.put("suggestType", "No need mark");
                        } else if (arrayList.size() > 0) {
                            Collections.sort(arrayList, new Comparator<People>() {
                                public int compare(People people, People people2) {
                                    int access$000 = LoadPeopleTask.this.getPeopleTypePriorityForMyself(people, defaultNameForMyself);
                                    int access$0002 = LoadPeopleTask.this.getPeopleTypePriorityForMyself(people2, defaultNameForMyself);
                                    return access$000 == access$0002 ? people2.getFaceCount() - people.getFaceCount() : access$000 - access$0002;
                                }
                            });
                            int i4 = LoadPeopleTask.this.mMarkInfo.getInt("option_suggestion_limit", -1);
                            if (i4 > 0 && arrayList.size() > i4) {
                                arrayList = new ArrayList(arrayList.subList(0, i4));
                            }
                            hashMap.put("suggestType", "Normal");
                            hashMap.put("peopleOfMyself", String.valueOf(i2));
                            hashMap.put("peopleNameOfMe", String.valueOf(i3));
                        }
                        if (arrayList == null || arrayList.isEmpty()) {
                            hashMap.put("suggestType", "No people");
                        }
                        GallerySamplingStatHelper.recordCountEvent("people_mark", "mark_myself_triggered", hashMap);
                        return new Pair<>(Integer.valueOf(i), arrayList);
                    }
                    i = 0;
                    hashMap.put("suggestType", "No people");
                    GallerySamplingStatHelper.recordCountEvent("people_mark", "mark_myself_triggered", hashMap);
                    return new Pair<>(Integer.valueOf(i), arrayList);
                }
            });
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Pair<Integer, ArrayList<People>> pair) {
            if (this.mCallback == null) {
                return;
            }
            if (((Integer) pair.first).intValue() == 2) {
                this.mCallback.onNoNeedMark();
            } else if (((Integer) pair.first).intValue() == 0 || pair.second == null) {
                this.mCallback.onPeopleSuggestionLoadFailed();
            } else {
                this.mCallback.onPeopleSuggestionLoaded((ArrayList) pair.second);
            }
        }
    }

    private static class MarkPeopleTask extends AsyncTask<Bundle, Void, Boolean> {
        private MarkPeopleCallback mCallback;
        private WeakReference<Context> mContextRef;
        private People mMarkPeople;

        public MarkPeopleTask(Context context, People people, MarkPeopleCallback markPeopleCallback) {
            this.mContextRef = new WeakReference<>(context);
            this.mMarkPeople = people;
            this.mCallback = markPeopleCallback;
        }

        /* access modifiers changed from: protected */
        public Boolean doInBackground(Bundle... bundleArr) {
            Context context = (Context) this.mContextRef.get();
            return Boolean.valueOf(context != null && NormalPeopleFaceMediaSet.moveFaceToMyselfGroup(context, this.mMarkPeople.getId()));
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Boolean bool) {
            Context context = (Context) this.mContextRef.get();
            if (context != null && this.mCallback != null) {
                if (bool == null || !bool.booleanValue()) {
                    this.mCallback.onMarkPeopleFailed(context.getString(R.string.mark_operation_failed));
                } else {
                    this.mCallback.onMarkPeopleSucceeded();
                }
            }
        }
    }

    private boolean isMarkingMyself(Bundle bundle) {
        String string = bundle.getString("option_mark_relation");
        return !TextUtils.isEmpty(string) && PeopleContactInfo.getRelationType(string) == Relation.myself.getRelationType();
    }

    public void loadMarkSuggestion(Context context, Bundle bundle, LoadMarkSuggestionCallback loadMarkSuggestionCallback) {
        if (isMarkingMyself(bundle)) {
            new LoadPeopleTask(context, bundle, loadMarkSuggestionCallback).execute(new Void[0]);
        } else {
            loadMarkSuggestionCallback.onPeopleSuggestionLoadFailed();
        }
    }

    public void markPeople(Context context, People people, Bundle bundle, MarkPeopleCallback markPeopleCallback) {
        if (isMarkingMyself(bundle)) {
            new MarkPeopleTask(context, people, markPeopleCallback).execute(new Bundle[]{bundle});
            return;
        }
        markPeopleCallback.onMarkPeopleFailed(null);
    }

    public boolean needMark(Bundle bundle) {
        return isMarkingMyself(bundle) && Face.getMarkMyselfTriggeredCount() <= 0 && Face.isFirstSyncCompleted();
    }

    public void onMarkSuggestionTriggered(Bundle bundle) {
        if (isMarkingMyself(bundle)) {
            Face.onMarkMyselfTriggered();
        }
    }

    public void setMarkResult(Bundle bundle, boolean z) {
        if (isMarkingMyself(bundle)) {
            Face.setMarkMyselfResult(z);
        }
    }
}
