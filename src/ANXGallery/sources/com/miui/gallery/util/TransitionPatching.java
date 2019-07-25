package com.miui.gallery.util;

import android.app.Activity;
import android.os.Build.VERSION;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnPreDrawListener;
import android.view.Window;
import java.lang.reflect.Method;

public class TransitionPatching {
    public static void onActivityStopWhenEnterStarting(Activity activity) {
        Log.w("TransitionPatching", "onActivityStopWhenEnterStarting");
        if (activity != null && VERSION.SDK_INT > 23) {
            try {
                Object field = ReflectUtils.getField("android.app.Activity", activity, "mActivityTransitionState");
                if (field != null) {
                    Object field2 = ReflectUtils.getField("android.app.ActivityTransitionState", field, "mEnterTransitionCoordinator");
                    if (field2 != null) {
                        Method method = ReflectUtils.getMethod("android.app.EnterTransitionCoordinator", "forceViewsToAppear", new Class[0]);
                        if (method != null) {
                            ReflectUtils.invokeMethod(field2, method, new Object[0]);
                            Log.d("TransitionPatching", "forceViewsToAppear");
                        }
                        Object field3 = ReflectUtils.getField("android.app.EnterTransitionCoordinator", field2, "mViewsReadyListener");
                        if (field3 != null) {
                            Method method2 = ReflectUtils.getMethod("com.android.internal.view.OneShotPreDrawListener", "removeListener", new Class[0]);
                            if (method2 != null) {
                                ReflectUtils.invokeMethod(field3, method2, new Object[0]);
                                Log.d("TransitionPatching", "removeListener");
                            }
                        }
                    }
                }
            } catch (Exception e) {
                Log.w("TransitionPatching", "preActivityStop occurs error.\n", e);
            }
        }
    }

    public static void setOnEnterStartedListener(Activity activity, final Runnable runnable) {
        Log.d("TransitionPatching", "onStartEnterTransition");
        if (activity != null && runnable != null) {
            Window window = activity.getWindow();
            if (window != null) {
                final View decorView = window.getDecorView();
                if (decorView != null) {
                    final ViewTreeObserver viewTreeObserver = decorView.getViewTreeObserver();
                    if (viewTreeObserver != null) {
                        viewTreeObserver.addOnPreDrawListener(new OnPreDrawListener() {
                            public boolean onPreDraw() {
                                Log.d("TransitionPatching", "onEnterTransitionStarted");
                                runnable.run();
                                if (viewTreeObserver.isAlive()) {
                                    viewTreeObserver.removeOnPreDrawListener(this);
                                } else {
                                    ViewTreeObserver viewTreeObserver = decorView.getViewTreeObserver();
                                    if (viewTreeObserver != null && viewTreeObserver.isAlive()) {
                                        viewTreeObserver.removeOnPreDrawListener(this);
                                    }
                                }
                                return true;
                            }
                        });
                    }
                }
            }
        }
    }
}
