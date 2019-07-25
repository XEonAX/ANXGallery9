package com.miui.gallery.widget.editwrapper;

import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuItem;

public class SimpleMultiChoiceModeListener implements MultiChoiceModeListener {
    public boolean onActionItemClicked(ActionMode actionMode, MenuItem menuItem) {
        return false;
    }

    public void onAllItemsCheckedStateChanged(ActionMode actionMode, boolean z) {
    }

    public boolean onCreateActionMode(ActionMode actionMode, Menu menu) {
        return false;
    }

    public void onDestroyActionMode(ActionMode actionMode) {
    }

    public void onItemCheckedStateChanged(ActionMode actionMode, int i, long j, boolean z) {
    }

    public boolean onPrepareActionMode(ActionMode actionMode, Menu menu) {
        return false;
    }
}
