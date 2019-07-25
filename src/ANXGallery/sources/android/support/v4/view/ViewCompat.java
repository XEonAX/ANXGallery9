package android.support.v4.view;

import android.animation.ValueAnimator;
import android.os.Build.VERSION;
import android.view.Display;
import android.view.View;
import android.view.View.OnApplyWindowInsetsListener;
import android.view.WindowInsets;
import android.view.WindowManager;
import java.lang.reflect.Field;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;

public class ViewCompat {
    static final ViewCompatBaseImpl IMPL;

    static class ViewCompatApi15Impl extends ViewCompatBaseImpl {
        ViewCompatApi15Impl() {
        }
    }

    static class ViewCompatApi16Impl extends ViewCompatApi15Impl {
        ViewCompatApi16Impl() {
        }

        public int getImportantForAccessibility(View view) {
            return view.getImportantForAccessibility();
        }

        public int getMinimumHeight(View view) {
            return view.getMinimumHeight();
        }

        public int getMinimumWidth(View view) {
            return view.getMinimumWidth();
        }

        public boolean hasOverlappingRendering(View view) {
            return view.hasOverlappingRendering();
        }

        public boolean hasTransientState(View view) {
            return view.hasTransientState();
        }

        public void postInvalidateOnAnimation(View view) {
            view.postInvalidateOnAnimation();
        }

        public void postOnAnimation(View view, Runnable runnable) {
            view.postOnAnimation(runnable);
        }

        public void postOnAnimationDelayed(View view, Runnable runnable, long j) {
            view.postOnAnimationDelayed(runnable, j);
        }

        public void setImportantForAccessibility(View view, int i) {
            if (i == 4) {
                i = 2;
            }
            view.setImportantForAccessibility(i);
        }
    }

    static class ViewCompatApi17Impl extends ViewCompatApi16Impl {
        ViewCompatApi17Impl() {
        }

        public Display getDisplay(View view) {
            return view.getDisplay();
        }

        public int getLayoutDirection(View view) {
            return view.getLayoutDirection();
        }

        public int getPaddingEnd(View view) {
            return view.getPaddingEnd();
        }

        public int getPaddingStart(View view) {
            return view.getPaddingStart();
        }
    }

    static class ViewCompatApi18Impl extends ViewCompatApi17Impl {
        ViewCompatApi18Impl() {
        }
    }

    static class ViewCompatApi19Impl extends ViewCompatApi18Impl {
        ViewCompatApi19Impl() {
        }

        public boolean isAttachedToWindow(View view) {
            return view.isAttachedToWindow();
        }

        public void setImportantForAccessibility(View view, int i) {
            view.setImportantForAccessibility(i);
        }
    }

    static class ViewCompatApi21Impl extends ViewCompatApi19Impl {
        ViewCompatApi21Impl() {
        }

        public WindowInsetsCompat dispatchApplyWindowInsets(View view, WindowInsetsCompat windowInsetsCompat) {
            WindowInsets windowInsets = (WindowInsets) WindowInsetsCompat.unwrap(windowInsetsCompat);
            WindowInsets dispatchApplyWindowInsets = view.dispatchApplyWindowInsets(windowInsets);
            if (dispatchApplyWindowInsets != windowInsets) {
                windowInsets = new WindowInsets(dispatchApplyWindowInsets);
            }
            return WindowInsetsCompat.wrap(windowInsets);
        }

        public float getElevation(View view) {
            return view.getElevation();
        }

        public String getTransitionName(View view) {
            return view.getTransitionName();
        }

        public WindowInsetsCompat onApplyWindowInsets(View view, WindowInsetsCompat windowInsetsCompat) {
            WindowInsets windowInsets = (WindowInsets) WindowInsetsCompat.unwrap(windowInsetsCompat);
            WindowInsets onApplyWindowInsets = view.onApplyWindowInsets(windowInsets);
            if (onApplyWindowInsets != windowInsets) {
                windowInsets = new WindowInsets(onApplyWindowInsets);
            }
            return WindowInsetsCompat.wrap(windowInsets);
        }

        public void setElevation(View view, float f) {
            view.setElevation(f);
        }

        public void setOnApplyWindowInsetsListener(View view, final OnApplyWindowInsetsListener onApplyWindowInsetsListener) {
            if (onApplyWindowInsetsListener == null) {
                view.setOnApplyWindowInsetsListener(null);
            } else {
                view.setOnApplyWindowInsetsListener(new OnApplyWindowInsetsListener() {
                    public WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
                        return (WindowInsets) WindowInsetsCompat.unwrap(onApplyWindowInsetsListener.onApplyWindowInsets(view, WindowInsetsCompat.wrap(windowInsets)));
                    }
                });
            }
        }

        public void setTransitionName(View view, String str) {
            view.setTransitionName(str);
        }

        public void stopNestedScroll(View view) {
            view.stopNestedScroll();
        }
    }

    static class ViewCompatApi23Impl extends ViewCompatApi21Impl {
        ViewCompatApi23Impl() {
        }
    }

    static class ViewCompatApi24Impl extends ViewCompatApi23Impl {
        ViewCompatApi24Impl() {
        }
    }

    static class ViewCompatApi26Impl extends ViewCompatApi24Impl {
        ViewCompatApi26Impl() {
        }
    }

    static class ViewCompatBaseImpl {
        static boolean sAccessibilityDelegateCheckFailed = false;
        static Field sAccessibilityDelegateField;
        private static Field sMinHeightField;
        private static boolean sMinHeightFieldFetched;
        private static Field sMinWidthField;
        private static boolean sMinWidthFieldFetched;
        private static final AtomicInteger sNextGeneratedId = new AtomicInteger(1);
        private static WeakHashMap<View, String> sTransitionNameMap;
        WeakHashMap<View, Object> mViewPropertyAnimatorCompatMap = null;

        ViewCompatBaseImpl() {
        }

        public WindowInsetsCompat dispatchApplyWindowInsets(View view, WindowInsetsCompat windowInsetsCompat) {
            return windowInsetsCompat;
        }

        public Display getDisplay(View view) {
            if (isAttachedToWindow(view)) {
                return ((WindowManager) view.getContext().getSystemService("window")).getDefaultDisplay();
            }
            return null;
        }

        public float getElevation(View view) {
            return 0.0f;
        }

        /* access modifiers changed from: 0000 */
        public long getFrameTime() {
            return ValueAnimator.getFrameDelay();
        }

        public int getImportantForAccessibility(View view) {
            return 0;
        }

        public int getLayoutDirection(View view) {
            return 0;
        }

        public int getMinimumHeight(View view) {
            if (!sMinHeightFieldFetched) {
                try {
                    sMinHeightField = View.class.getDeclaredField("mMinHeight");
                    sMinHeightField.setAccessible(true);
                } catch (NoSuchFieldException unused) {
                }
                sMinHeightFieldFetched = true;
            }
            if (sMinHeightField != null) {
                try {
                    return ((Integer) sMinHeightField.get(view)).intValue();
                } catch (Exception unused2) {
                }
            }
            return 0;
        }

        public int getMinimumWidth(View view) {
            if (!sMinWidthFieldFetched) {
                try {
                    sMinWidthField = View.class.getDeclaredField("mMinWidth");
                    sMinWidthField.setAccessible(true);
                } catch (NoSuchFieldException unused) {
                }
                sMinWidthFieldFetched = true;
            }
            if (sMinWidthField != null) {
                try {
                    return ((Integer) sMinWidthField.get(view)).intValue();
                } catch (Exception unused2) {
                }
            }
            return 0;
        }

        public int getPaddingEnd(View view) {
            return view.getPaddingRight();
        }

        public int getPaddingStart(View view) {
            return view.getPaddingLeft();
        }

        public String getTransitionName(View view) {
            if (sTransitionNameMap == null) {
                return null;
            }
            return (String) sTransitionNameMap.get(view);
        }

        public boolean hasAccessibilityDelegate(View view) {
            boolean z = false;
            if (sAccessibilityDelegateCheckFailed) {
                return false;
            }
            if (sAccessibilityDelegateField == null) {
                try {
                    sAccessibilityDelegateField = View.class.getDeclaredField("mAccessibilityDelegate");
                    sAccessibilityDelegateField.setAccessible(true);
                } catch (Throwable unused) {
                    sAccessibilityDelegateCheckFailed = true;
                    return false;
                }
            }
            try {
                if (sAccessibilityDelegateField.get(view) != null) {
                    z = true;
                }
                return z;
            } catch (Throwable unused2) {
                sAccessibilityDelegateCheckFailed = true;
                return false;
            }
        }

        public boolean hasOverlappingRendering(View view) {
            return true;
        }

        public boolean hasTransientState(View view) {
            return false;
        }

        public boolean isAttachedToWindow(View view) {
            return view.getWindowToken() != null;
        }

        public WindowInsetsCompat onApplyWindowInsets(View view, WindowInsetsCompat windowInsetsCompat) {
            return windowInsetsCompat;
        }

        public void postInvalidateOnAnimation(View view) {
            view.postInvalidate();
        }

        public void postOnAnimation(View view, Runnable runnable) {
            view.postDelayed(runnable, getFrameTime());
        }

        public void postOnAnimationDelayed(View view, Runnable runnable, long j) {
            view.postDelayed(runnable, getFrameTime() + j);
        }

        public void setAccessibilityDelegate(View view, AccessibilityDelegateCompat accessibilityDelegateCompat) {
            view.setAccessibilityDelegate(accessibilityDelegateCompat == null ? null : accessibilityDelegateCompat.getBridge());
        }

        public void setElevation(View view, float f) {
        }

        public void setImportantForAccessibility(View view, int i) {
        }

        public void setOnApplyWindowInsetsListener(View view, OnApplyWindowInsetsListener onApplyWindowInsetsListener) {
        }

        public void setTransitionName(View view, String str) {
            if (sTransitionNameMap == null) {
                sTransitionNameMap = new WeakHashMap<>();
            }
            sTransitionNameMap.put(view, str);
        }

        public void stopNestedScroll(View view) {
            if (view instanceof NestedScrollingChild) {
                ((NestedScrollingChild) view).stopNestedScroll();
            }
        }
    }

    static {
        if (VERSION.SDK_INT >= 26) {
            IMPL = new ViewCompatApi26Impl();
        } else if (VERSION.SDK_INT >= 24) {
            IMPL = new ViewCompatApi24Impl();
        } else if (VERSION.SDK_INT >= 23) {
            IMPL = new ViewCompatApi23Impl();
        } else if (VERSION.SDK_INT >= 21) {
            IMPL = new ViewCompatApi21Impl();
        } else if (VERSION.SDK_INT >= 19) {
            IMPL = new ViewCompatApi19Impl();
        } else if (VERSION.SDK_INT >= 18) {
            IMPL = new ViewCompatApi18Impl();
        } else if (VERSION.SDK_INT >= 17) {
            IMPL = new ViewCompatApi17Impl();
        } else if (VERSION.SDK_INT >= 16) {
            IMPL = new ViewCompatApi16Impl();
        } else if (VERSION.SDK_INT >= 15) {
            IMPL = new ViewCompatApi15Impl();
        } else {
            IMPL = new ViewCompatBaseImpl();
        }
    }

    public static WindowInsetsCompat dispatchApplyWindowInsets(View view, WindowInsetsCompat windowInsetsCompat) {
        return IMPL.dispatchApplyWindowInsets(view, windowInsetsCompat);
    }

    public static Display getDisplay(View view) {
        return IMPL.getDisplay(view);
    }

    public static float getElevation(View view) {
        return IMPL.getElevation(view);
    }

    public static int getImportantForAccessibility(View view) {
        return IMPL.getImportantForAccessibility(view);
    }

    public static int getLayoutDirection(View view) {
        return IMPL.getLayoutDirection(view);
    }

    public static int getMinimumHeight(View view) {
        return IMPL.getMinimumHeight(view);
    }

    public static int getMinimumWidth(View view) {
        return IMPL.getMinimumWidth(view);
    }

    public static int getPaddingEnd(View view) {
        return IMPL.getPaddingEnd(view);
    }

    public static int getPaddingStart(View view) {
        return IMPL.getPaddingStart(view);
    }

    public static String getTransitionName(View view) {
        return IMPL.getTransitionName(view);
    }

    @Deprecated
    public static float getTranslationX(View view) {
        return view.getTranslationX();
    }

    @Deprecated
    public static float getTranslationY(View view) {
        return view.getTranslationY();
    }

    public static boolean hasAccessibilityDelegate(View view) {
        return IMPL.hasAccessibilityDelegate(view);
    }

    public static boolean hasOverlappingRendering(View view) {
        return IMPL.hasOverlappingRendering(view);
    }

    public static boolean hasTransientState(View view) {
        return IMPL.hasTransientState(view);
    }

    public static boolean isAttachedToWindow(View view) {
        return IMPL.isAttachedToWindow(view);
    }

    public static WindowInsetsCompat onApplyWindowInsets(View view, WindowInsetsCompat windowInsetsCompat) {
        return IMPL.onApplyWindowInsets(view, windowInsetsCompat);
    }

    public static void postInvalidateOnAnimation(View view) {
        IMPL.postInvalidateOnAnimation(view);
    }

    public static void postOnAnimation(View view, Runnable runnable) {
        IMPL.postOnAnimation(view, runnable);
    }

    public static void postOnAnimationDelayed(View view, Runnable runnable, long j) {
        IMPL.postOnAnimationDelayed(view, runnable, j);
    }

    public static void setAccessibilityDelegate(View view, AccessibilityDelegateCompat accessibilityDelegateCompat) {
        IMPL.setAccessibilityDelegate(view, accessibilityDelegateCompat);
    }

    public static void setElevation(View view, float f) {
        IMPL.setElevation(view, f);
    }

    public static void setImportantForAccessibility(View view, int i) {
        IMPL.setImportantForAccessibility(view, i);
    }

    public static void setOnApplyWindowInsetsListener(View view, OnApplyWindowInsetsListener onApplyWindowInsetsListener) {
        IMPL.setOnApplyWindowInsetsListener(view, onApplyWindowInsetsListener);
    }

    public static void setTransitionName(View view, String str) {
        IMPL.setTransitionName(view, str);
    }

    public static void stopNestedScroll(View view) {
        IMPL.stopNestedScroll(view);
    }
}
