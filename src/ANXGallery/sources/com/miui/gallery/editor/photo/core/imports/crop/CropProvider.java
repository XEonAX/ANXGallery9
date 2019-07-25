package com.miui.gallery.editor.photo.core.imports.crop;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.RenderEngine;
import com.miui.gallery.editor.photo.core.SdkManager;
import com.miui.gallery.editor.photo.core.SdkProvider;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractCropFragment;
import com.miui.gallery.editor.photo.core.common.model.CropData;
import com.miui.gallery.editor.photo.core.common.model.CropData.AspectRatio;
import java.util.Arrays;
import java.util.List;

public class CropProvider extends SdkProvider<CropData, AbstractCropFragment> {
    private List<CropData> mDataList;

    static {
        SdkManager.INSTANCE.register(new CropProvider());
    }

    protected CropProvider() {
        super(Effect.CROP);
        AspectRatio aspectRatio = new AspectRatio(1, "free", R.drawable.crop_menu_item_free, R.string.photo_editor_talkback_crop_free, 0, 0);
        AspectRatio aspectRatio2 = new AspectRatio(1, "original", R.drawable.crop_menu_item_origin, R.string.photo_editor_talkback_crop_original, -1, -1);
        AspectRatio aspectRatio3 = new AspectRatio(1, "screen", R.drawable.crop_menu_item_screen, R.string.photo_editor_talkback_crop_screen, -2, -2);
        AspectRatio aspectRatio4 = new AspectRatio(2, "1:1", R.drawable.crop_menu_item_1_1, R.string.photo_editor_talkback_crop_1_1, 1, 1);
        AspectRatio aspectRatio5 = new AspectRatio(2, "3:4", R.drawable.crop_menu_item_3_4, R.string.photo_editor_talkback_crop_3_4, 3, 4);
        AspectRatio aspectRatio6 = new AspectRatio(2, "4:3", R.drawable.crop_menu_item_4_3, R.string.photo_editor_talkback_crop_4_3, 4, 3);
        AspectRatio aspectRatio7 = new AspectRatio(2, "16:9", R.drawable.crop_menu_item_16_9, R.string.photo_editor_talkback_crop_16_9, 16, 9);
        AspectRatio aspectRatio8 = new AspectRatio(2, "9:16", R.drawable.crop_menu_item_9_16, R.string.photo_editor_talkback_crop_9_16, 9, 16);
        AspectRatio aspectRatio9 = new AspectRatio(2, "2:3", R.drawable.crop_menu_item_2_3, R.string.photo_editor_talkback_crop_2_3, 2, 3);
        AspectRatio aspectRatio10 = new AspectRatio(2, "3:2", R.drawable.crop_menu_item_3_2, R.string.photo_editor_talkback_crop_3_2, 3, 2);
        this.mDataList = Arrays.asList(new CropData[]{aspectRatio, aspectRatio2, aspectRatio3, aspectRatio4, aspectRatio5, aspectRatio6, aspectRatio7, aspectRatio8, aspectRatio9, aspectRatio10});
    }

    public RenderEngine createEngine(Context context) {
        return new CropEngine();
    }

    public List<CropData> list() {
        return this.mDataList;
    }

    /* access modifiers changed from: protected */
    public void onActivityCreate() {
        super.onActivityCreate();
        notifyInitializeFinish();
    }

    public AbstractCropFragment onCreateFragment() {
        return new CropFragment();
    }
}
