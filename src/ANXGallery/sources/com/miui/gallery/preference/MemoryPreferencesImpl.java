package com.miui.gallery.preference;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.os.Looper;
import com.miui.gallery.threadpool.ThreadManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.WeakHashMap;

class MemoryPreferencesImpl implements SharedPreferences {
    private static final Object CONTENT = new Object();
    /* access modifiers changed from: private */
    public final WeakHashMap<OnSharedPreferenceChangeListener, Object> mListeners = new WeakHashMap<>();
    /* access modifiers changed from: private */
    public final Object mLock = new Object();
    /* access modifiers changed from: private */
    public Map<String, Object> mMap = new HashMap();

    public final class EditorImpl implements Editor {
        private boolean mClear = false;
        private final Object mEditLock = new Object();
        private final Map<String, Object> mModified = new HashMap();

        EditorImpl() {
        }

        /* JADX WARNING: Removed duplicated region for block: B:40:0x00b4  */
        /* JADX WARNING: Removed duplicated region for block: B:59:0x0058 A[SYNTHETIC] */
        private void commitToMemory() {
            Set set;
            boolean z = MemoryPreferencesImpl.this.mListeners.size() > 0;
            ArrayList arrayList = null;
            if (z) {
                arrayList = new ArrayList();
                set = new HashSet(MemoryPreferencesImpl.this.mListeners.keySet());
            } else {
                set = null;
            }
            synchronized (MemoryPreferencesImpl.this.mLock) {
                synchronized (this.mEditLock) {
                    if (this.mClear) {
                        if (!MemoryPreferencesImpl.this.mMap.isEmpty()) {
                            MemoryPreferencesImpl.this.mMap.clear();
                        }
                        this.mClear = false;
                    }
                    for (Entry entry : this.mModified.entrySet()) {
                        String str = (String) entry.getKey();
                        Object value = entry.getValue();
                        if (value != this) {
                            if (value != null) {
                                if (MemoryPreferencesImpl.this.mMap.containsKey(str)) {
                                    Object obj = MemoryPreferencesImpl.this.mMap.get(str);
                                    if (obj != null && obj.equals(value)) {
                                    }
                                }
                                MemoryPreferencesImpl.this.mMap.put(str, value);
                                if (!z) {
                                    arrayList.add(str);
                                }
                            }
                        }
                        if (MemoryPreferencesImpl.this.mMap.containsKey(str)) {
                            MemoryPreferencesImpl.this.mMap.remove(str);
                            if (!z) {
                            }
                        }
                    }
                    this.mModified.clear();
                }
            }
            notifyListeners(set, arrayList);
        }

        private void notifyListeners(final Set<OnSharedPreferenceChangeListener> set, final List<String> list) {
            if (set != null && list != null && list.size() != 0) {
                AnonymousClass1 r0 = new Runnable() {
                    public void run() {
                        for (int size = list.size() - 1; size >= 0; size--) {
                            String str = (String) list.get(size);
                            for (OnSharedPreferenceChangeListener onSharedPreferenceChangeListener : set) {
                                if (onSharedPreferenceChangeListener != null) {
                                    onSharedPreferenceChangeListener.onSharedPreferenceChanged(MemoryPreferencesImpl.this, str);
                                }
                            }
                        }
                    }
                };
                if (Looper.myLooper() == Looper.getMainLooper()) {
                    r0.run();
                } else {
                    ThreadManager.getMainHandler().post(r0);
                }
            }
        }

        public void apply() {
            commitToMemory();
        }

        public Editor clear() {
            synchronized (this.mEditLock) {
                this.mClear = true;
            }
            return this;
        }

        public boolean commit() {
            commitToMemory();
            return true;
        }

        public Editor putBoolean(String str, boolean z) {
            synchronized (this.mEditLock) {
                this.mModified.put(str, Boolean.valueOf(z));
            }
            return this;
        }

        public Editor putFloat(String str, float f) {
            synchronized (this.mEditLock) {
                this.mModified.put(str, Float.valueOf(f));
            }
            return this;
        }

        public Editor putInt(String str, int i) {
            synchronized (this.mEditLock) {
                this.mModified.put(str, Integer.valueOf(i));
            }
            return this;
        }

        public Editor putLong(String str, long j) {
            synchronized (this.mEditLock) {
                this.mModified.put(str, Long.valueOf(j));
            }
            return this;
        }

        public Editor putString(String str, String str2) {
            synchronized (this.mEditLock) {
                this.mModified.put(str, str2);
            }
            return this;
        }

        public Editor putStringSet(String str, Set<String> set) {
            synchronized (this.mEditLock) {
                this.mModified.put(str, set == null ? null : new HashSet(set));
            }
            return this;
        }

        public Editor remove(String str) {
            synchronized (this.mEditLock) {
                this.mModified.put(str, this);
            }
            return this;
        }
    }

    MemoryPreferencesImpl() {
    }

    public boolean contains(String str) {
        boolean containsKey;
        synchronized (this.mLock) {
            containsKey = this.mMap.containsKey(str);
        }
        return containsKey;
    }

    public Editor edit() {
        return new EditorImpl();
    }

    public Map<String, ?> getAll() {
        HashMap hashMap;
        synchronized (this.mLock) {
            hashMap = new HashMap(this.mMap);
        }
        return hashMap;
    }

    public boolean getBoolean(String str, boolean z) {
        synchronized (this.mLock) {
            Boolean bool = (Boolean) this.mMap.get(str);
            if (bool != null) {
                z = bool.booleanValue();
            }
        }
        return z;
    }

    public float getFloat(String str, float f) {
        synchronized (this.mLock) {
            Float f2 = (Float) this.mMap.get(str);
            if (f2 != null) {
                f = f2.floatValue();
            }
        }
        return f;
    }

    public int getInt(String str, int i) {
        synchronized (this.mLock) {
            Integer num = (Integer) this.mMap.get(str);
            if (num != null) {
                i = num.intValue();
            }
        }
        return i;
    }

    public long getLong(String str, long j) {
        synchronized (this.mLock) {
            Long l = (Long) this.mMap.get(str);
            if (l != null) {
                j = l.longValue();
            }
        }
        return j;
    }

    public String getString(String str, String str2) {
        String str3;
        synchronized (this.mLock) {
            str3 = (String) this.mMap.get(str);
            if (str3 == null) {
                str3 = str2;
            }
        }
        return str3;
    }

    public Set<String> getStringSet(String str, Set<String> set) {
        Set<String> set2;
        synchronized (this.mLock) {
            set2 = (Set) this.mMap.get(str);
            if (set2 == null) {
                set2 = set;
            }
        }
        return set2;
    }

    public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener onSharedPreferenceChangeListener) {
        synchronized (this.mLock) {
            this.mListeners.put(onSharedPreferenceChangeListener, CONTENT);
        }
    }

    public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener onSharedPreferenceChangeListener) {
        synchronized (this.mLock) {
            this.mListeners.remove(onSharedPreferenceChangeListener);
        }
    }
}
