package com.miui.gallery.adapter;

import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap.Config;
import android.graphics.RectF;
import android.net.Uri;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.model.PeopleContactInfo;
import com.miui.gallery.ui.PeoplePageGridHeaderItem;
import com.miui.gallery.ui.PeoplePageGridItem;
import com.miui.gallery.util.face.PeopleCursorHelper;
import com.miui.gallery.util.face.PeopleItemBitmapDisplayer;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.tonicartos.widget.stickygridheaders.StickyGridHeadersSimpleAdapter;
import java.util.HashMap;

public class PeoplePageAdapter extends BaseAdapter implements CheckableAdapter, StickyGridHeadersSimpleAdapter {
    private boolean mCheckable;
    private HashMap<String, Integer> mUserDefineRelationMap;

    public PeoplePageAdapter(Context context) {
        super(context);
        this.mContext = context;
    }

    public void bindView(View view, Context context, Cursor cursor) {
        PeoplePageGridItem peoplePageGridItem = (PeoplePageGridItem) view;
        int position = cursor.getPosition();
        peoplePageGridItem.bindImage(PeopleCursorHelper.getThumbnailPath(cursor), getDownloadUri(position), getDisplayImageOptions(position), PeopleCursorHelper.getFaceRegionRectF(cursor), PeopleCursorHelper.getThumbnailDownloadType(cursor));
        String peopleName = PeopleCursorHelper.getPeopleName(cursor);
        String peopleServerId = PeopleCursorHelper.getPeopleServerId(cursor);
        long parseLong = Long.parseLong(PeopleCursorHelper.getPeopleLocalId(cursor));
        if (!TextUtils.isEmpty(peopleName)) {
            peoplePageGridItem.setName(peopleName);
        } else {
            peoplePageGridItem.setName(this.mContext.getString(R.string.people_page_unname));
        }
        peoplePageGridItem.saveIds2Tag(parseLong, peopleServerId);
        peoplePageGridItem.setCheckable(this.mCheckable);
    }

    public void enterChoiceMode() {
        this.mCheckable = true;
    }

    public void exitChoiceMode() {
        this.mCheckable = false;
    }

    public View getCheckableView(View view) {
        return null;
    }

    public View getDividerView(int i, View view, ViewGroup viewGroup) {
        return null;
    }

    public Uri getDownloadUri(int i) {
        return PeopleCursorHelper.getThumbnailDownloadUri(getCursorByPosition(i));
    }

    public RectF getFaceRegionRectF(int i) {
        return PeopleCursorHelper.getFaceRegionRectF(getCursorByPosition(i));
    }

    public long getFileLength(int i) {
        return PeopleCursorHelper.getCoverSize(getCursorByPosition(i));
    }

    public long getHeaderId(int i) {
        int relationTypeOfItem = getRelationTypeOfItem(i);
        if (!PeopleContactInfo.isUserDefineRelation(relationTypeOfItem)) {
            return (long) relationTypeOfItem;
        }
        int i2 = 0;
        String relationTextOfItem = getRelationTextOfItem(i);
        if (!(this.mUserDefineRelationMap == null || this.mUserDefineRelationMap.get(relationTextOfItem) == null)) {
            i2 = ((Integer) this.mUserDefineRelationMap.get(relationTextOfItem)).intValue();
        }
        return (long) (PeopleContactInfo.getRelationTypesCount() + i2);
    }

    public View getHeaderView(int i, View view, ViewGroup viewGroup) {
        int relationTypeOfItem = getRelationTypeOfItem(i);
        if (PeopleContactInfo.isUnKnownRelation(relationTypeOfItem)) {
            return LayoutInflater.from(this.mContext).inflate(R.layout.people_page_undifined_header_item, viewGroup, false);
        }
        if (view == null || !(view instanceof PeoplePageGridHeaderItem)) {
            view = LayoutInflater.from(this.mContext).inflate(R.layout.people_page_grid_header_item, viewGroup, false);
        }
        ((PeoplePageGridHeaderItem) view).bindData(PeopleContactInfo.isUserDefineRelation(relationTypeOfItem) ? getRelationTextOfItem(i) : PeopleContactInfo.getRelationShow(relationTypeOfItem));
        return view;
    }

    public String getPeopleIdOfItem(int i) {
        return PeopleCursorHelper.getPeopleServerId((Cursor) getItem(i));
    }

    public String getPeopleLocalIdOfItem(int i) {
        return PeopleCursorHelper.getPeopleLocalId((Cursor) getItem(i));
    }

    public String getRelationTextOfItem(int i) {
        return PeopleCursorHelper.getRelationText((Cursor) getItem(i));
    }

    public int getRelationTypeOfItem(int i) {
        return PeopleCursorHelper.getRelationType((Cursor) getItem(i));
    }

    public String getThumbFilePath(int i) {
        return PeopleCursorHelper.getThumbnailPath(getCursorByPosition(i));
    }

    /* access modifiers changed from: protected */
    public void initDisplayImageOptions() {
        this.mDisplayImageOptionBuilder = new Builder().cacheThumbnail(true).loadFromMicroCache(true).cacheInMemory(true).considerExifParams(true).showStubImage(R.drawable.default_face_cover).resetViewBeforeLoading(true).imageScaleType(ImageScaleType.EXACTLY).bitmapConfig(Config.RGB_565).displayer(new PeopleItemBitmapDisplayer(true)).usingRegionDecoderFace(true);
        this.mDefaultDisplayImageOptions = this.mDisplayImageOptionBuilder.build();
    }

    public View newView(Context context, Cursor cursor, ViewGroup viewGroup) {
        return LayoutInflater.from(context).inflate(R.layout.people_page_grid_item, viewGroup, false);
    }

    public void setUserDefineRelationMap(HashMap<String, Integer> hashMap) {
        this.mUserDefineRelationMap = hashMap;
    }

    public boolean shouldDrawDivider() {
        return false;
    }
}
