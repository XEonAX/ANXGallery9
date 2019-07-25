package com.miui.gallery.editor.photo.core.imports.text;

import com.miui.gallery.editor.photo.core.common.model.TextData;
import com.miui.gallery.editor.photo.core.imports.text.dialog.BaseDialogModel;
import com.miui.gallery.editor.photo.core.imports.text.dialog.DialogManager;
import com.miui.gallery.editor.photo.core.imports.text.dialog.DialogManager.LocalDialog;
import com.miui.gallery.editor.photo.core.imports.text.dialog.LocalDialogModel;
import java.util.ArrayList;
import java.util.List;

public class TextManager {
    public static TextConfig getDefaultTextConfig() {
        LocalDialog localDialog = LocalDialog.NONE;
        LocalDialogModel localDialogModel = new LocalDialogModel(localDialog.mBackGroundColor, localDialog.mSmallIcon, localDialog.mGraphics, localDialog.mLeftPercent, localDialog.mTopPercent, localDialog.mRightPercent, localDialog.mBottomPercent, localDialog.mIsCorner, localDialog.mCornerPosition, localDialog.name());
        return new TextConfig(0, localDialogModel.name, localDialogModel);
    }

    public static List<TextData> getScreenTextBubbleData() {
        DialogManager dialogManager = new DialogManager();
        ArrayList arrayList = new ArrayList();
        List dialogModelList = dialogManager.getDialogModelList();
        int i = 0;
        while (i < dialogModelList.size() && i < 5) {
            BaseDialogModel baseDialogModel = (BaseDialogModel) dialogModelList.get(i);
            arrayList.add(new TextConfig(0, baseDialogModel.name, baseDialogModel));
            i++;
        }
        return arrayList;
    }
}
