package com.miui.gallery.assistant.library;

import android.annotation.SuppressLint;
import android.content.ContentValues;
import android.database.Cursor;
import android.text.TextUtils;
import com.google.gson.annotations.SerializedName;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.dao.base.TableColumn;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GsonUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.io.File;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;
import org.json.JSONException;

public class Library extends Entity {
    private long mLibraryId;
    @SerializedName("galleryResourceInfoList")
    private ArrayList<LibraryItem> mLibraryItems;
    private LibraryStatus mLibraryStatus = LibraryStatus.STATE_DEFAULT;
    private long mRefreshTime;

    public enum LibraryStatus {
        STATE_DEFAULT,
        STATE_NO_LIBRARY_INFO,
        STATE_NOT_DOWNLOADED,
        STATE_DOWNLOADING,
        STATE_ABI_UNAVAILABLE,
        STATE_AVAILABLE,
        STATE_LOADED
    }

    private void ensureLibraryDependency() {
        if (MiscUtil.isValid(this.mLibraryItems)) {
            LinkedBlockingQueue linkedBlockingQueue = new LinkedBlockingQueue(this.mLibraryItems.size());
            LinkedList<LibraryItem> linkedList = new LinkedList<>();
            LinkedList linkedList2 = new LinkedList(this.mLibraryItems);
            Iterator it = linkedList2.iterator();
            while (it.hasNext()) {
                LibraryItem libraryItem = (LibraryItem) it.next();
                if (libraryItem.getParentId() == -1) {
                    linkedList.add(libraryItem);
                    it.remove();
                }
            }
            LinkedList linkedList3 = new LinkedList();
            while (!linkedList.isEmpty()) {
                linkedList3.clear();
                linkedBlockingQueue.addAll(linkedList);
                for (LibraryItem libraryItem2 : linkedList) {
                    Iterator it2 = linkedList2.iterator();
                    while (it2.hasNext()) {
                        LibraryItem libraryItem3 = (LibraryItem) it2.next();
                        if (libraryItem3.getParentId() == libraryItem2.getId()) {
                            linkedList3.add(libraryItem3);
                            it2.remove();
                        }
                    }
                }
                linkedList.clear();
                linkedList.addAll(linkedList3);
            }
            synchronized (this) {
                this.mLibraryItems.clear();
                this.mLibraryItems.addAll(linkedBlockingQueue);
            }
        }
    }

    @SuppressLint({"UnsafeDynamicallyLoadedCode"})
    private boolean loadInternal(String str) {
        try {
            System.load(str);
            return true;
        } catch (Error e) {
            reportAlgorithmLoadError(e);
            return false;
        }
    }

    private void reportAlgorithmLoadError(Throwable th) {
        Log.e("Library", th);
        Map generatorCommonParams = GallerySamplingStatHelper.generatorCommonParams();
        generatorCommonParams.put("algorithm", getClass().getSimpleName());
        generatorCommonParams.put("error", th != null ? th.toString() : "");
        GallerySamplingStatHelper.recordCountEvent("assistant", "assistant_algorithm_error", generatorCommonParams);
    }

    /* access modifiers changed from: 0000 */
    public long getLibraryId() {
        return this.mLibraryId;
    }

    public List<LibraryItem> getLibraryItems() {
        return this.mLibraryItems;
    }

    public LibraryStatus getLibraryStatus() {
        return this.mLibraryStatus;
    }

    /* access modifiers changed from: protected */
    public List<TableColumn> getTableColumns() {
        ArrayList arrayList = new ArrayList();
        addColumn(arrayList, "libraryId", "INTEGER");
        addColumn(arrayList, "libraryItems", "TEXT");
        addColumn(arrayList, "refreshTime", "INTEGER");
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public String[] getUniqueConstraints() {
        return new String[]{"libraryId"};
    }

    public synchronized boolean isExist() {
        if (!MiscUtil.isValid(this.mLibraryItems)) {
            return false;
        }
        Iterator it = this.mLibraryItems.iterator();
        while (it.hasNext()) {
            if (!((LibraryItem) it.next()).isExist()) {
                return false;
            }
        }
        return true;
    }

    public boolean isLibraryItemInfosConsistent() {
        if (!MiscUtil.isValid(this.mLibraryItems)) {
            return false;
        }
        String extraInfo = ((LibraryItem) this.mLibraryItems.get(0)).getExtraInfo();
        Iterator it = this.mLibraryItems.iterator();
        while (it.hasNext()) {
            if (!TextUtils.equals(extraInfo, ((LibraryItem) it.next()).getExtraInfo())) {
                return false;
            }
        }
        return true;
    }

    public synchronized boolean isLoaded() {
        if (!MiscUtil.isValid(this.mLibraryItems)) {
            return false;
        }
        Iterator it = this.mLibraryItems.iterator();
        while (it.hasNext()) {
            LibraryItem libraryItem = (LibraryItem) it.next();
            if (libraryItem.isTypeSo() && !libraryItem.isLoaded()) {
                return false;
            }
        }
        return true;
    }

    /* access modifiers changed from: 0000 */
    public boolean isOverDue() {
        return System.currentTimeMillis() > this.mRefreshTime + 604800000;
    }

    public synchronized boolean load() {
        if (MiscUtil.isValid(this.mLibraryItems)) {
            ensureLibraryDependency();
            Iterator it = this.mLibraryItems.iterator();
            while (it.hasNext()) {
                LibraryItem libraryItem = (LibraryItem) it.next();
                if (!libraryItem.isLoaded()) {
                    if (libraryItem.isTypeSo()) {
                        if (libraryItem.isLocal()) {
                            try {
                                System.loadLibrary(libraryItem.getName());
                                libraryItem.setLoaded(true);
                            } catch (Exception unused) {
                                Log.e("Library", "Load internal local library %d error", (Object) Long.valueOf(libraryItem.getId()));
                            }
                        } else {
                            File file = new File(libraryItem.getTargetPath(GalleryApp.sGetAndroidContext()));
                            if (file.exists()) {
                                if (loadInternal(file.getAbsolutePath())) {
                                    StringBuilder sb = new StringBuilder();
                                    sb.append("Library loaded success:");
                                    sb.append(file);
                                    Log.d("Library", sb.toString());
                                    libraryItem.setLoaded(true);
                                } else {
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append("Library load failed:");
                                    sb2.append(file);
                                    Log.d("Library", sb2.toString());
                                }
                            }
                        }
                    }
                }
            }
        }
        return isLoaded();
    }

    /* access modifiers changed from: protected */
    public void onConvertToContents(ContentValues contentValues) {
        contentValues.put("libraryId", Long.valueOf(this.mLibraryId));
        contentValues.put("libraryItems", GsonUtils.toString(this.mLibraryItems));
        contentValues.put("refreshTime", Long.valueOf(this.mRefreshTime));
    }

    /* access modifiers changed from: protected */
    public void onInitFromCursor(Cursor cursor) {
        this.mLibraryId = getLong(cursor, "libraryId");
        try {
            this.mLibraryItems = GsonUtils.getArray(getString(cursor, "libraryItems"), (Type) LibraryItem.class);
        } catch (JSONException unused) {
            Log.e("Library", "Create libraryItems of library %d from cursor error", (Object) Long.valueOf(this.mLibraryId));
        }
        this.mRefreshTime = getLong(cursor, "refreshTime");
    }

    public void setLibraryId(long j) {
        this.mLibraryId = j;
    }

    public void setLibraryStatus(LibraryStatus libraryStatus) {
        this.mLibraryStatus = libraryStatus;
    }

    /* access modifiers changed from: 0000 */
    public void setRefreshTime(long j) {
        this.mRefreshTime = j;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Library{mLibraryId=");
        sb.append(this.mLibraryId);
        sb.append('}');
        return sb.toString();
    }
}
