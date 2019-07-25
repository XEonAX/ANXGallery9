package miui.gallery.support;

import android.content.Context;
import android.content.res.Resources;
import android.util.Log;
import android.widget.Button;
import com.android.internal.SystemPropertiesCompat;
import com.miui.gallery.util.LazyValue;
import miui.R;
import miui.util.AppConstants;
import miui.view.EditActionMode;

public class MiuiSdkCompat {
    private static final LazyValue<Context, Boolean> DARK_ICON_SUPPORTED = new LazyValue<Context, Boolean>() {
        /* access modifiers changed from: protected */
        public Boolean onInit(Context context) {
            return Boolean.valueOf(context.getResources().getIdentifier("action_mode_title_button_confirm_dark", "drawable", "miui") != 0);
        }
    };
    private static final LazyValue<Context, Integer> MIUI_SDK_LEVEL = new LazyValue<Context, Integer>() {
        /* access modifiers changed from: protected */
        public Integer onInit(Context context) {
            return Integer.valueOf(AppConstants.getSdkLevel(context, "com.miui.core"));
        }
    };
    private static final LazyValue<Void, Integer> MIUI_VERSION_CODE = new LazyValue<Void, Integer>() {
        /* access modifiers changed from: protected */
        public Integer onInit(Void voidR) {
            return Integer.valueOf(SystemPropertiesCompat.getInt("ro.miui.ui.version.code", 0));
        }
    };

    private static boolean isMiui10StyleUsable(Context context) {
        return ((Integer) MIUI_SDK_LEVEL.get(context)).intValue() >= 15 || ((Integer) MIUI_VERSION_CODE.get(null)).intValue() >= 8;
    }

    private static boolean isNightMode(Context context) {
        return context != null && (context.getResources().getConfiguration().uiMode & 48) == 32;
    }

    public static void setEditActionModeButton(Context context, Button button, int i) {
        if (context != null && button != null) {
            if (isMiui10StyleUsable(context)) {
                setEditActionModeButtonByIcon(context, button, i);
            } else {
                setEditActionModeButtonByText(button, i);
            }
        }
    }

    public static void setEditActionModeButton(Context context, EditActionMode editActionMode, int i, int i2) {
        if (context != null && editActionMode != null) {
            if (isMiui10StyleUsable(context)) {
                try {
                    setEditActionModeButtonByIcon(context, editActionMode, i, i2);
                } catch (Throwable th) {
                    Log.w("MiuiSdkCompat", "set EditActionMode button icon is not supported", th);
                    setEditActionModeButtonByText(editActionMode, i, i2);
                }
            } else {
                setEditActionModeButtonByText(editActionMode, i, i2);
            }
        }
    }

    private static void setEditActionModeButtonByIcon(Context context, Button button, int i) {
        button.setText("");
        Resources resources = context.getResources();
        switch (i) {
            case 0:
                button.setBackgroundResource((!((Boolean) DARK_ICON_SUPPORTED.get(context)).booleanValue() || !isNightMode(context)) ? R.drawable.action_mode_title_button_select_all_light : R.drawable.action_mode_title_button_select_all_dark);
                button.setContentDescription(resources.getString(R.string.select_all));
                return;
            case 1:
                button.setBackgroundResource((!((Boolean) DARK_ICON_SUPPORTED.get(context)).booleanValue() || !isNightMode(context)) ? R.drawable.action_mode_title_button_deselect_all_light : R.drawable.action_mode_title_button_deselect_all_dark);
                button.setContentDescription(resources.getString(R.string.deselect_all));
                return;
            case 2:
                button.setBackgroundResource((!((Boolean) DARK_ICON_SUPPORTED.get(context)).booleanValue() || !isNightMode(context)) ? R.drawable.action_mode_title_button_confirm_light : R.drawable.action_mode_title_button_confirm_dark);
                button.setContentDescription(resources.getString(17039370));
                return;
            case 3:
                button.setBackgroundResource((!((Boolean) DARK_ICON_SUPPORTED.get(context)).booleanValue() || !isNightMode(context)) ? R.drawable.action_mode_title_button_cancel_light : R.drawable.action_mode_title_button_cancel_dark);
                button.setContentDescription(resources.getString(17039360));
                return;
            default:
                return;
        }
    }

    private static void setEditActionModeButtonByIcon(Context context, EditActionMode editActionMode, int i, int i2) {
        switch (i2) {
            case 0:
                editActionMode.setButton(i, "", (!((Boolean) DARK_ICON_SUPPORTED.get(context)).booleanValue() || !isNightMode(context)) ? R.drawable.action_mode_title_button_select_all_light : R.drawable.action_mode_title_button_select_all_dark);
                return;
            case 1:
                editActionMode.setButton(i, "", (!((Boolean) DARK_ICON_SUPPORTED.get(context)).booleanValue() || !isNightMode(context)) ? R.drawable.action_mode_title_button_deselect_all_light : R.drawable.action_mode_title_button_deselect_all_dark);
                return;
            case 2:
                editActionMode.setButton(i, "", (!((Boolean) DARK_ICON_SUPPORTED.get(context)).booleanValue() || !isNightMode(context)) ? R.drawable.action_mode_title_button_confirm_light : R.drawable.action_mode_title_button_confirm_dark);
                return;
            case 3:
                editActionMode.setButton(i, "", (!((Boolean) DARK_ICON_SUPPORTED.get(context)).booleanValue() || !isNightMode(context)) ? R.drawable.action_mode_title_button_cancel_light : R.drawable.action_mode_title_button_cancel_dark);
                return;
            default:
                return;
        }
    }

    private static void setEditActionModeButtonByText(Button button, int i) {
        switch (i) {
            case 0:
                button.setText(R.string.select_all);
                return;
            case 1:
                button.setText(R.string.deselect_all);
                return;
            case 2:
                button.setText(17039370);
                return;
            case 3:
                button.setText(17039360);
                return;
            default:
                return;
        }
    }

    private static void setEditActionModeButtonByText(EditActionMode editActionMode, int i, int i2) {
        switch (i2) {
            case 0:
                editActionMode.setButton(i, R.string.select_all);
                return;
            case 1:
                editActionMode.setButton(i, R.string.deselect_all);
                return;
            case 2:
                editActionMode.setButton(i, 17039370);
                return;
            case 3:
                editActionMode.setButton(i, 17039360);
                return;
            default:
                return;
        }
    }
}
