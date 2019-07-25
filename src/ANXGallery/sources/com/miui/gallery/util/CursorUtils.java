package com.miui.gallery.util;

import android.database.Cursor;
import android.database.MatrixCursor;

public class CursorUtils {
    public static void addRowToMatrixCursor(Cursor cursor, MatrixCursor matrixCursor, Object[] objArr) {
        int length = objArr.length;
        for (int i = 0; i < length; i++) {
            switch (cursor.getType(i)) {
                case 0:
                    objArr[i] = null;
                    break;
                case 1:
                    objArr[i] = Long.valueOf(cursor.getLong(i));
                    break;
                case 2:
                    objArr[i] = Double.valueOf(cursor.getDouble(i));
                    break;
                case 3:
                    objArr[i] = cursor.getString(i);
                    break;
                case 4:
                    objArr[i] = cursor.getBlob(i);
                    break;
            }
        }
        matrixCursor.addRow(objArr);
    }
}
