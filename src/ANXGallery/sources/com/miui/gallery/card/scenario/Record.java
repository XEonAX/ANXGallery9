package com.miui.gallery.card.scenario;

import android.content.ContentValues;
import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.TableColumn;
import com.miui.gallery.util.GsonUtils;
import com.miui.gallery.util.Log;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class Record extends Entity {
    private long mEndTime;
    private String mLocation;
    private List<Long> mMediaIds;
    private String mPeopleId;
    private String mPrimaryKey;
    private int mScenarioId;
    private String mSecondaryKey;
    private long mStartTime;
    private int mState;
    private long mTargetTime;
    private String mTertiaryKey;
    private long mTime;

    public static class UniqueKey {
        private final long mEndTime;
        private final String mLocation;
        private final String mPeopleId;
        private final String mPrimaryKey;
        private final int mScenarioId;
        private final String mSecondaryKey;
        private final long mStartTime;
        private final long mTargetTime;
        private final String mTertiaryKey;

        UniqueKey(int i, long j, long j2, long j3, String str, String str2, String str3, String str4, String str5) {
            this.mScenarioId = i;
            this.mStartTime = j;
            this.mEndTime = j2;
            this.mTargetTime = j3;
            this.mPeopleId = str;
            this.mLocation = str2;
            this.mPrimaryKey = str3;
            this.mSecondaryKey = str4;
            this.mTertiaryKey = str5;
        }

        public boolean equals(Object obj) {
            boolean z = true;
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof UniqueKey)) {
                return false;
            }
            UniqueKey uniqueKey = (UniqueKey) obj;
            if (this.mScenarioId != uniqueKey.mScenarioId || (this.mStartTime != uniqueKey.mStartTime && ((this.mTargetTime <= 0 || this.mTargetTime != uniqueKey.mTargetTime) && (TextUtils.isEmpty(this.mLocation) || TextUtils.isEmpty(uniqueKey.mLocation) || !TextUtils.equals(this.mLocation, uniqueKey.mLocation))))) {
                z = false;
            }
            return z;
        }

        public String getLocation() {
            return this.mLocation;
        }

        public String getPrimaryKey() {
            return this.mPrimaryKey;
        }

        public int getScenarioId() {
            return this.mScenarioId;
        }

        public long getStartTime() {
            return this.mStartTime;
        }

        public long getTargetTime() {
            return this.mTargetTime <= 0 ? this.mStartTime : this.mTargetTime;
        }

        public int hashCode() {
            return (((this.mScenarioId * 31) + ((int) (this.mStartTime ^ (this.mStartTime >>> 32)))) * 31) + ((int) (this.mTargetTime ^ (this.mTargetTime >>> 32)));
        }
    }

    private Record() {
    }

    public Record(Scenario scenario, List<Long> list) {
        this.mTime = DateUtils.getCurrentTimeMillis();
        this.mMediaIds = list;
        this.mState = 1;
        if (scenario != null) {
            this.mScenarioId = scenario.getScenarioId();
            this.mStartTime = scenario.getStartTime();
            this.mEndTime = scenario.getEndTime();
            this.mTargetTime = scenario.getTargetTime() <= 0 ? this.mStartTime : scenario.getTargetTime();
            this.mPeopleId = scenario.getPeopleId();
            this.mLocation = scenario.getLocation();
            this.mPrimaryKey = scenario.getPrimaryKey();
            this.mSecondaryKey = scenario.getSecondary();
            this.mTertiaryKey = scenario.getTertiaryKey();
        }
    }

    public long getEndTime() {
        return this.mEndTime;
    }

    public String getLocation() {
        return this.mLocation;
    }

    public List<Long> getMediaIds() {
        return this.mMediaIds;
    }

    public String getPeopleId() {
        return this.mPeopleId;
    }

    public String getPrimaryKey() {
        return this.mPrimaryKey;
    }

    public int getScenarioId() {
        return this.mScenarioId;
    }

    public String getSecondaryKey() {
        return this.mSecondaryKey;
    }

    public long getStartTime() {
        return this.mStartTime;
    }

    public int getState() {
        return this.mState;
    }

    /* access modifiers changed from: protected */
    public List<TableColumn> getTableColumns() {
        ArrayList arrayList = new ArrayList();
        addColumn(arrayList, "scenarioId", "INTEGER");
        addColumn(arrayList, "scenarioStartTime", "INTEGER");
        addColumn(arrayList, "scenarioEndTime", "INTEGER");
        addColumn(arrayList, "scenarioPeopleId", "TEXT");
        addColumn(arrayList, "scenarioLocation", "TEXT");
        addColumn(arrayList, "scenarioPrimaryKey", "TEXT");
        addColumn(arrayList, "scenarioSecondaryKey", "TEXT");
        addColumn(arrayList, "scenarioTertiaryKey", "TEXT");
        addColumn(arrayList, "time", "INTEGER");
        addColumn(arrayList, "state", "INTEGER");
        addColumn(arrayList, "medias", "TEXT");
        addColumn(arrayList, "scenarioTargetTime", "INTEGER");
        return arrayList;
    }

    public long getTargetTime() {
        return this.mTargetTime <= 0 ? this.mStartTime : this.mTargetTime;
    }

    public long getTime() {
        return this.mTime;
    }

    /* access modifiers changed from: protected */
    public String[] getUniqueConstraints() {
        return new String[]{"scenarioId"};
    }

    public UniqueKey getUniqueKey() {
        UniqueKey uniqueKey = new UniqueKey(getScenarioId(), getStartTime(), getEndTime(), getTargetTime(), getPeopleId(), getLocation(), getPrimaryKey(), getSecondaryKey(), getPrimaryKey());
        return uniqueKey;
    }

    /* access modifiers changed from: protected */
    public void onConvertToContents(ContentValues contentValues) {
        contentValues.put("scenarioId", Integer.valueOf(this.mScenarioId));
        contentValues.put("scenarioStartTime", Long.valueOf(this.mStartTime));
        contentValues.put("scenarioEndTime", Long.valueOf(this.mEndTime));
        contentValues.put("scenarioPeopleId", this.mPeopleId == null ? "" : this.mPeopleId);
        contentValues.put("scenarioLocation", this.mLocation == null ? "" : this.mLocation);
        contentValues.put("scenarioPrimaryKey", this.mPrimaryKey == null ? "" : this.mPrimaryKey);
        contentValues.put("scenarioSecondaryKey", this.mSecondaryKey == null ? "" : this.mSecondaryKey);
        contentValues.put("scenarioTertiaryKey", this.mTertiaryKey == null ? "" : this.mTertiaryKey);
        contentValues.put("time", Long.valueOf(this.mTime));
        contentValues.put("state", Integer.valueOf(this.mState));
        contentValues.put("medias", GsonUtils.toString(this.mMediaIds));
        contentValues.put("scenarioTargetTime", Long.valueOf(this.mTargetTime));
    }

    /* access modifiers changed from: protected */
    public void onInitFromCursor(Cursor cursor) {
        this.mScenarioId = getInt(cursor, "scenarioId");
        this.mStartTime = getLong(cursor, "scenarioStartTime");
        this.mEndTime = getLong(cursor, "scenarioEndTime");
        this.mPeopleId = getString(cursor, "scenarioPeopleId");
        this.mLocation = getString(cursor, "scenarioLocation");
        this.mPrimaryKey = getString(cursor, "scenarioPrimaryKey");
        this.mSecondaryKey = getString(cursor, "scenarioSecondaryKey");
        this.mTertiaryKey = getString(cursor, "scenarioTertiaryKey");
        this.mTime = getLong(cursor, "time");
        this.mState = getInt(cursor, "state");
        try {
            this.mMediaIds = GsonUtils.getArray(getString(cursor, "medias"), (Type) Long.class);
        } catch (Exception unused) {
            Log.e("Record", "Get media array of scenario %d from cursor error", (Object) Integer.valueOf(this.mScenarioId));
        }
        this.mTargetTime = getLong(cursor, "scenarioTargetTime");
        this.mTargetTime = this.mTargetTime <= 0 ? this.mStartTime : this.mTargetTime;
    }

    public void setState(int i) {
        this.mState = i;
    }
}
