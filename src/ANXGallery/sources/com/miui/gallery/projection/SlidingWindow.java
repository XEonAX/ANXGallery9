package com.miui.gallery.projection;

import android.text.TextUtils;
import com.miui.gallery.model.BaseDataItem;
import com.miui.gallery.model.BaseDataSet;
import com.miui.gallery.util.Log;
import java.util.Arrays;

/* compiled from: ConnectController */
class SlidingWindow {
    private int mCurrentIndex = 0;
    private boolean mCurrentIndexChanged = true;
    private int mEndIndex;
    private String[] mFiles = new String[151];
    private BaseDataSet mMediaSet;
    private int mStartIndex;
    private int mTotalCount;

    SlidingWindow() {
    }

    private void doSlideWindow(int i) {
        if (this.mMediaSet == null) {
            reset();
            return;
        }
        this.mTotalCount = this.mMediaSet.getCount();
        if (this.mTotalCount <= 0) {
            reset();
            return;
        }
        int i2 = 0;
        this.mStartIndex = Math.max(i - 75, 0);
        this.mEndIndex = Math.min(i + 75 + 1, this.mTotalCount);
        for (int i3 = this.mStartIndex; i3 < this.mEndIndex; i3++) {
            BaseDataItem item = this.mMediaSet.getItem(null, i3);
            if (item != null) {
                String pathDisplayBetter = item.getPathDisplayBetter();
                if (!TextUtils.isEmpty(pathDisplayBetter)) {
                    this.mFiles[i2] = pathDisplayBetter;
                    i2++;
                }
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append("slideWindow, mStartIndex=");
        sb.append(this.mStartIndex);
        sb.append(", mEndIndex=");
        sb.append(this.mEndIndex);
        Log.i("SlidingWindow", sb.toString());
    }

    private int indexOf(String str) {
        String[] strArr;
        if (str != null) {
            int i = 0;
            for (String str2 : this.mFiles) {
                if (str2 != null && str2.equals(str)) {
                    return i;
                }
                i++;
            }
        }
        return -1;
    }

    private boolean isWindowDirty(int i) {
        return (this.mStartIndex > 0 && i - this.mStartIndex < 50) || (this.mEndIndex < this.mTotalCount && this.mEndIndex - i < 50);
    }

    private void reset() {
        this.mStartIndex = 0;
        this.mEndIndex = 0;
        Arrays.fill(this.mFiles, null);
        this.mCurrentIndex = 0;
        this.mCurrentIndexChanged = true;
    }

    private void slideWindowTo(int i) {
        if (this.mMediaSet == null) {
            reset();
            return;
        }
        int count = this.mMediaSet.getCount();
        if (count <= 0) {
            reset();
            return;
        }
        if (i < 0) {
            i = 0;
        } else if (i >= count) {
            i = count - 1;
        }
        if (this.mStartIndex == this.mEndIndex || count != this.mTotalCount || (this.mTotalCount > this.mEndIndex - this.mStartIndex && isWindowDirty(i))) {
            doSlideWindow(i);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:39:0x0086, code lost:
        return null;
     */
    public synchronized String getNext(String str, boolean z) {
        if (this.mCurrentIndexChanged) {
            this.mCurrentIndexChanged = false;
            slideWindowTo(this.mCurrentIndex);
        }
        if (this.mTotalCount > 0) {
            if (!TextUtils.isEmpty(str)) {
                int indexOf = indexOf(str);
                if (indexOf == -1) {
                    indexOf = this.mCurrentIndex - this.mStartIndex;
                } else if (indexOf == (this.mEndIndex - this.mStartIndex) - 1) {
                    if (this.mEndIndex < this.mTotalCount) {
                        slideWindowTo(this.mEndIndex - 1);
                        indexOf = indexOf(str);
                    } else if (!z) {
                        return null;
                    } else {
                        slideWindowTo(0);
                        indexOf = -1;
                    }
                }
                int i = indexOf + 1;
                if (z) {
                    if (i >= this.mFiles.length) {
                        i = 0;
                    }
                } else if (i >= this.mFiles.length) {
                    return null;
                }
                String str2 = "SlidingWindow";
                StringBuilder sb = new StringBuilder();
                sb.append("getNext: next=");
                sb.append(this.mFiles[i]);
                sb.append(", index=");
                sb.append(i);
                Log.i(str2, sb.toString());
                return this.mFiles[i];
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:30:0x006a, code lost:
        return null;
     */
    public synchronized String getPrevious(String str, boolean z) {
        if (this.mCurrentIndexChanged) {
            this.mCurrentIndexChanged = false;
            slideWindowTo(this.mCurrentIndex);
        }
        if (this.mTotalCount > 0) {
            if (!TextUtils.isEmpty(str)) {
                int indexOf = indexOf(str);
                if (indexOf == 0) {
                    slideWindowTo(this.mStartIndex);
                    indexOf = indexOf(str);
                }
                if (indexOf == -1) {
                    indexOf = this.mCurrentIndex - this.mStartIndex;
                }
                int i = indexOf - 1;
                if (z) {
                    if (i < 0) {
                        i = this.mFiles.length - 1;
                    }
                } else if (i < 0) {
                    return null;
                }
                String str2 = "SlidingWindow";
                StringBuilder sb = new StringBuilder();
                sb.append("getPrevious: pre=");
                sb.append(this.mFiles[i]);
                sb.append(", index=");
                sb.append(i);
                Log.i(str2, sb.toString());
                return this.mFiles[i];
            }
        }
    }

    public synchronized void onCurrentIndexChanged(int i) {
        this.mCurrentIndexChanged |= this.mCurrentIndex != i;
        this.mCurrentIndex = i;
    }

    public synchronized void setMediaSet(BaseDataSet baseDataSet) {
        if (!(this.mMediaSet == baseDataSet && baseDataSet == null)) {
            if (baseDataSet == null || this.mMediaSet != baseDataSet) {
                reset();
            }
            this.mMediaSet = baseDataSet;
        }
    }
}
