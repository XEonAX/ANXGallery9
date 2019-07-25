package com.miui.gallery.view.menu;

import android.view.View;
import com.miui.gallery.widget.BottomMenu;

public class BottomMenuBarUtils {
    public static BottomMenu findBottomMenuBar(View view) {
        while (view != null) {
            if (view instanceof BottomMenu) {
                return (BottomMenu) view;
            }
            view = view.getParent() instanceof View ? (View) view.getParent() : null;
        }
        return null;
    }
}
