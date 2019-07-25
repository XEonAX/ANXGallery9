package com.miui.gallery.activity;

import android.arch.lifecycle.Lifecycle.Event;
import android.arch.lifecycle.LifecycleObserver;
import android.arch.lifecycle.LifecycleOwner;
import android.arch.lifecycle.OnLifecycleEvent;
import android.os.Bundle;
import android.util.Pair;
import com.miui.gallery.app.Activity;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

public class SimpleAppLifecycleTestActivity extends Activity {
    static List<Pair<TestEventType, Event>> sCollectedEvents = new ArrayList();
    static CountDownLatch sLatch = new CountDownLatch(11);
    private static TestObserver sProcessObserver = new TestObserver(TestEventType.PROCESS_EVENT);

    public enum TestEventType {
        PROCESS_EVENT,
        ACTIVITY_EVENT
    }

    static class TestObserver implements LifecycleObserver {
        private TestEventType mType;

        TestObserver(TestEventType testEventType) {
            this.mType = testEventType;
        }

        /* access modifiers changed from: 0000 */
        @OnLifecycleEvent(Event.ON_ANY)
        public void onEvent(LifecycleOwner lifecycleOwner, Event event) {
            SimpleAppLifecycleTestActivity.sCollectedEvents.add(new Pair(this.mType, event));
            SimpleAppLifecycleTestActivity.sLatch.countDown();
        }
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getLifecycle().addObserver(new TestObserver(TestEventType.ACTIVITY_EVENT));
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        finish();
    }
}
