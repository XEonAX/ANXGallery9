package com.miui.gallery.util;

import android.database.Cursor;
import android.database.CursorWrapper;
import java.util.ArrayList;
import java.util.List;

public class BurstFilterCursor extends CursorWrapper {
    private int mPos = 0;
    protected ArrayList<Integer> mResultPos = new ArrayList<>();

    public BurstFilterCursor(Cursor cursor) {
        super(cursor);
        initResultList();
    }

    public static void wrapGroupInfos(List<Integer> list, int i, List<Integer> list2, List<Integer> list3) {
        int size = list2.size();
        int i2 = 0;
        int i3 = 1;
        int i4 = 0;
        for (int i5 = 0; i5 < i && i2 < size; i5++) {
            if (i3 < size && ((Integer) list2.get(i3)).intValue() == i5) {
                int i6 = i3;
                i3++;
                i2 = i6;
            }
            if (i4 >= list.size() || ((Integer) list.get(i4)).intValue() != i5) {
                list3.set(i2, Integer.valueOf(((Integer) list3.get(i2)).intValue() - 1));
            } else {
                i4++;
            }
        }
        for (int i7 = 1; i7 < list2.size(); i7++) {
            int i8 = i7 - 1;
            list2.set(i7, Integer.valueOf(((Integer) list2.get(i8)).intValue() + ((Integer) list3.get(i8)).intValue()));
        }
    }

    public int getBurstCount(int i) {
        if (getWrappedCursor() == null) {
            return 0;
        }
        int i2 = i + 1;
        return i2 < this.mResultPos.size() ? ((Integer) this.mResultPos.get(i2)).intValue() - ((Integer) this.mResultPos.get(i)).intValue() : getWrappedCursor().getCount() - ((Integer) this.mResultPos.get(i)).intValue();
    }

    public ArrayList<Long> getBurstIdsInGroup(int i, int i2) {
        ArrayList<Long> arrayList = new ArrayList<>();
        int contentCursorPosition = getContentCursorPosition(i);
        int burstCount = (getBurstCount(i) + contentCursorPosition) - 1;
        while (contentCursorPosition <= burstCount) {
            Cursor contentCursorAtPosition = getContentCursorAtPosition(contentCursorPosition);
            if (contentCursorAtPosition != null) {
                arrayList.add(Long.valueOf(contentCursorAtPosition.getLong(i2)));
            }
            contentCursorPosition++;
        }
        return arrayList;
    }

    public Cursor getContentCursorAtPosition(int i) {
        if (getWrappedCursor().moveToPosition(i)) {
            return getWrappedCursor();
        }
        return null;
    }

    public int getContentCursorPosition(int i) {
        if (i < 0 || i >= this.mResultPos.size()) {
            return -1;
        }
        return ((Integer) this.mResultPos.get(i)).intValue();
    }

    public int getCount() {
        return this.mResultPos.size();
    }

    public int getPosition() {
        return this.mPos;
    }

    public ArrayList<Integer> getResultPos() {
        return new ArrayList<>(this.mResultPos);
    }

    /* access modifiers changed from: protected */
    public void initResultList() {
        Cursor wrappedCursor = getWrappedCursor();
        if (getWrappedCursor() != null) {
            int columnIndex = wrappedCursor.getColumnIndex("burst_group_id");
            long j = -1;
            for (int i = 0; i < wrappedCursor.getCount(); i++) {
                if (wrappedCursor.moveToPosition(i)) {
                    if (columnIndex <= 0 || wrappedCursor.getLong(columnIndex) <= 0) {
                        this.mResultPos.add(Integer.valueOf(i));
                        j = -1;
                    } else {
                        long j2 = wrappedCursor.getLong(columnIndex);
                        if (j2 != j) {
                            this.mResultPos.add(Integer.valueOf(i));
                            j = j2;
                        }
                    }
                }
            }
        }
    }

    public boolean isBurstPosition(int i) {
        boolean z = false;
        if (i < 0 || i > this.mResultPos.size()) {
            return false;
        }
        moveToPosition(i);
        int columnIndex = getColumnIndex("burst_group_id");
        if (columnIndex > 0 && getLong(columnIndex) > 0) {
            z = true;
        }
        return z;
    }

    public boolean move(int i) {
        return moveToPosition(this.mPos + i);
    }

    public boolean moveToFirst() {
        return moveToPosition(0);
    }

    public boolean moveToLast() {
        return moveToPosition(getCount() - 1);
    }

    public boolean moveToNext() {
        return moveToPosition(this.mPos + 1);
    }

    public boolean moveToPosition(int i) {
        if (i < 0 || i >= this.mResultPos.size()) {
            if (i < 0) {
                this.mPos = -1;
            }
            if (i >= this.mResultPos.size()) {
                this.mPos = this.mResultPos.size();
            }
            return false;
        }
        this.mPos = i;
        return getWrappedCursor().moveToPosition(((Integer) this.mResultPos.get(i)).intValue());
    }

    public boolean moveToPrevious() {
        return moveToPosition(this.mPos - 1);
    }
}
