package com.miui.gallery.editor.photo.screen.base;

import android.app.Fragment;
import android.os.Bundle;
import com.miui.gallery.editor.photo.screen.base.IScreenOperation;
import com.miui.gallery.editor.photo.screen.home.ScreenEditorFragment;

public class ScreenBaseMenuFragment<T extends IScreenOperation> extends Fragment {
    protected T mScreenOperation;

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mScreenOperation = ((ScreenEditorFragment) getFragmentManager().findFragmentByTag("fragment_tag_editor")).getCurrentScreenEditor();
    }
}
