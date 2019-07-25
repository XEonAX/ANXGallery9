package com.miui.gallery.editor.photo.core.imports.text.dialog;

import com.miui.gallery.R;
import java.util.ArrayList;
import java.util.List;

public class DialogManager {
    private List<BaseDialogModel> mDialogModelList = new ArrayList();

    public enum LocalDialog {
        NONE(R.drawable.text_edit_bubble_none_icon, 0, R.color.text_menu_item_background_none, 0.0f, 0.0f, 0.0f, 0.0f),
        CIRCULAR(R.drawable.text_edit_bubble_circular_icon, R.drawable.text_edit_bubble_circular, R.color.text_menu_item_background_blue, 0.15f, 0.22f, 0.15f, 0.23f),
        RECTANGLE(R.drawable.text_edit_bubble_rectangle_icon, R.drawable.text_edit_bubble_rectangle, R.color.text_menu_item_background_green, 0.15f, 0.15f, 0.15f, 0.25f),
        RECT_HORIZONTAL(R.drawable.text_edit_bubble_rect_horizontal_icon, R.drawable.text_edit_bubble_rect_horizontal, R.color.text_menu_item_background_blue, 0.15f, 0.2f, 0.1f, 0.2f),
        OVAL(R.drawable.text_edit_bubble_oval_icon, R.drawable.text_edit_bubble_oval, R.color.text_menu_item_background_purple, 0.15f, 0.17f, 0.15f, 0.32f),
        ARROW_1(R.drawable.text_edit_bubble_arrow_1_icon, R.drawable.text_edit_bubble_arrow_1, R.color.text_menu_item_background_blue, 0),
        ARROW_2(R.drawable.text_edit_bubble_arrow_2_icon, R.drawable.text_edit_bubble_arrow_2, R.color.text_menu_item_background_purple, 0);
        
        public final int mBackGroundColor;
        public final float mBottomPercent;
        public final int mCornerPosition;
        public final int mGraphics;
        public final boolean mIsCorner;
        public final float mLeftPercent;
        public final float mRightPercent;
        public final int mSmallIcon;
        public final float mTopPercent;

        private LocalDialog(int i, int i2, int i3, float f, float f2, float f3, float f4) {
            this.mSmallIcon = i;
            this.mGraphics = i2;
            this.mBackGroundColor = i3;
            this.mLeftPercent = f;
            this.mTopPercent = f2;
            this.mRightPercent = f3;
            this.mBottomPercent = f4;
            this.mIsCorner = false;
            this.mCornerPosition = 0;
        }

        private LocalDialog(int i, int i2, int i3, int i4) {
            this.mSmallIcon = i;
            this.mGraphics = i2;
            this.mBackGroundColor = i3;
            this.mLeftPercent = 0.0f;
            this.mTopPercent = 0.0f;
            this.mRightPercent = 0.0f;
            this.mBottomPercent = 0.0f;
            this.mIsCorner = true;
            this.mCornerPosition = i4;
        }
    }

    public DialogManager() {
        LocalDialog[] values = LocalDialog.values();
        int length = values.length;
        int i = 0;
        while (i < length) {
            LocalDialog localDialog = values[i];
            LocalDialog[] localDialogArr = values;
            LocalDialogModel localDialogModel = r5;
            LocalDialogModel localDialogModel2 = new LocalDialogModel(localDialog.mBackGroundColor, localDialog.mSmallIcon, localDialog.mGraphics, localDialog.mLeftPercent, localDialog.mTopPercent, localDialog.mRightPercent, localDialog.mBottomPercent, localDialog.mIsCorner, localDialog.mCornerPosition, localDialog.name());
            this.mDialogModelList.add(localDialogModel);
            i++;
            values = localDialogArr;
        }
    }

    public List<BaseDialogModel> getDialogModelList() {
        return this.mDialogModelList;
    }
}
