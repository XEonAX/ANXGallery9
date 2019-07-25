package com.miui.gallery.discovery;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import com.miui.gallery.provider.GalleryContract.DiscoveryMessage;
import com.miui.gallery.util.Log;
import com.nexstreaming.nexeditorsdk.nexExportFormat;

public abstract class BaseMessageOperator<SaveParams> {
    protected static Uri sDiscoveryMessageUri = DiscoveryMessage.URI;

    protected static abstract class CRUDTask<T> {
        protected Context mContext;

        public CRUDTask(Context context) {
            this.mContext = context;
        }

        /* access modifiers changed from: protected */
        public abstract boolean execute(T t);

        /* access modifiers changed from: protected */
        public abstract T prepareData();

        /* access modifiers changed from: protected */
        public boolean run() {
            Object prepareData = prepareData();
            if (prepareData != null) {
                return execute(prepareData);
            }
            Log.e("BaseMessageOperator", "Can't execute task when prepared data was null");
            return false;
        }
    }

    protected static class InsertTask extends CRUDTask<ContentValues> {
        protected ContentValues mContentValues;

        public InsertTask(Context context, ContentValues contentValues) {
            super(context);
            this.mContentValues = contentValues;
        }

        private boolean doInsert(ContentValues contentValues) {
            return this.mContext.getContentResolver().insert(BaseMessageOperator.sDiscoveryMessageUri, contentValues) != null;
        }

        /* access modifiers changed from: protected */
        public boolean execute(ContentValues contentValues) {
            return doInsert(contentValues);
        }

        /* access modifiers changed from: protected */
        public ContentValues prepareData() {
            return this.mContentValues;
        }
    }

    protected static class UpdateTask extends CRUDTask<ContentValues> {
        ContentValues mContentValues;
        com.miui.gallery.model.DiscoveryMessage mMessage;

        public UpdateTask(Context context, com.miui.gallery.model.DiscoveryMessage discoveryMessage, ContentValues contentValues) {
            super(context);
            this.mMessage = discoveryMessage;
            this.mContentValues = contentValues;
        }

        /* access modifiers changed from: protected */
        public boolean execute(ContentValues contentValues) {
            return this.mContext.getContentResolver().update(BaseMessageOperator.sDiscoveryMessageUri, contentValues, getWhereClause(), getWhereArgs()) > 0;
        }

        /* access modifiers changed from: protected */
        public String[] getWhereArgs() {
            if (this.mMessage == null) {
                return new String[]{String.valueOf(this.mContentValues.get("_id"))};
            }
            return new String[]{String.valueOf(this.mMessage.getMessageId())};
        }

        /* access modifiers changed from: protected */
        public String getWhereClause() {
            return "_id = ?";
        }

        /* access modifiers changed from: protected */
        public ContentValues prepareData() {
            if (this.mContentValues == null) {
                this.mContentValues = new ContentValues();
                this.mContentValues.put(nexExportFormat.TAG_FORMAT_TYPE, Integer.valueOf(this.mMessage.getType()));
                this.mContentValues.put("receiveTime", Long.valueOf(this.mMessage.getReceiveTime()));
                this.mContentValues.put("updateTime", Long.valueOf(this.mMessage.getUpdateTime()));
                this.mContentValues.put("extraData", this.mMessage.getMessageDetail().toJson());
                this.mContentValues.put("triggerTime", Long.valueOf(this.mMessage.getTriggerTime()));
                this.mContentValues.put("isConsumed", Boolean.valueOf(this.mMessage.isConsumed()));
                this.mContentValues.put("expireTime", Long.valueOf(this.mMessage.getExpireTime()));
                this.mContentValues.put("actionUri", this.mMessage.getActionUri());
                this.mContentValues.put("messageSource", this.mMessage.getMessageSource());
                this.mContentValues.put("priority", Integer.valueOf(this.mMessage.getPriority()));
                this.mContentValues.put("subTitle", this.mMessage.getSubTitle());
                this.mContentValues.put("title", this.mMessage.getTitle());
                this.mContentValues.put("message", this.mMessage.getMessage());
            }
            return this.mContentValues;
        }
    }

    /* access modifiers changed from: protected */
    public abstract boolean doMarkMessageAsRead(Context context, com.miui.gallery.model.DiscoveryMessage discoveryMessage);

    /* access modifiers changed from: protected */
    public abstract boolean doSaveMessage(Context context, SaveParams saveparams);

    /* access modifiers changed from: protected */
    public boolean doUpdateMessage(Context context, com.miui.gallery.model.DiscoveryMessage discoveryMessage) {
        return new UpdateTask(context, discoveryMessage, null).run();
    }

    /* access modifiers changed from: protected */
    public abstract void doWrapMessage(com.miui.gallery.model.DiscoveryMessage discoveryMessage, String str);

    public abstract int getMessageType();

    public boolean markMessageAsRead(Context context, com.miui.gallery.model.DiscoveryMessage discoveryMessage) {
        return doMarkMessageAsRead(context, discoveryMessage);
    }

    /* access modifiers changed from: protected */
    public Cursor queryMessageByType(Context context) {
        return context.getContentResolver().query(sDiscoveryMessageUri, null, "type = ?", new String[]{String.valueOf(getMessageType())}, null);
    }

    public boolean saveMessage(Context context, SaveParams saveparams) {
        return doSaveMessage(context, saveparams);
    }

    public void wrapMessage(com.miui.gallery.model.DiscoveryMessage discoveryMessage, String str) {
        if (discoveryMessage != null && str != null) {
            doWrapMessage(discoveryMessage, str);
        }
    }
}
