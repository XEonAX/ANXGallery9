package com.miui.gallery.cloud.card.network;

import com.miui.gallery.cloud.card.exception.NoResultException;
import com.miui.gallery.cloud.card.exception.RequestArgumentsNullException;
import com.miui.gallery.cloud.card.exception.TypeNotFoundException;
import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.RequestError;
import com.miui.gallery.net.base.ResponseListener;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public class CommonGalleryRequestHelper<E> {
    private CommonGalleryRequest mBaseGalleryRequest;
    private Type mDataType;

    public CommonGalleryRequestHelper(RequestArguments<E> requestArguments) {
        if (requestArguments != null) {
            Type[] genericInterfaces = requestArguments.getClass().getGenericInterfaces();
            if (genericInterfaces.length <= 0 || !(genericInterfaces[0] instanceof ParameterizedType)) {
                throw new TypeNotFoundException();
            }
            Type type = ((ParameterizedType) genericInterfaces[0]).getActualTypeArguments()[0];
            if (type instanceof Class) {
                this.mDataType = type;
                this.mBaseGalleryRequest = new CommonGalleryRequest(requestArguments.getMethod(), requestArguments.getUrl(), this.mDataType);
                return;
            }
            throw new TypeNotFoundException();
        }
        throw new RequestArgumentsNullException();
    }

    public final CommonGalleryRequestHelper addParam(String str, String str2) {
        this.mBaseGalleryRequest.addParam(str, str2);
        return this;
    }

    public final void execute(final ResponseCallback<E> responseCallback) {
        this.mBaseGalleryRequest.setOnResponseListener(new ResponseListener() {
            public void onResponse(Object... objArr) {
                Object obj = objArr[0];
                if (responseCallback != null) {
                    responseCallback.onResponse(obj);
                }
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
                if (responseCallback != null) {
                    responseCallback.onResponseError(errorCode, str, obj);
                }
            }
        });
        this.mBaseGalleryRequest.execute();
    }

    public final E executeSync() throws RequestError, NoResultException {
        E[] executeSync = this.mBaseGalleryRequest.executeSync();
        if (executeSync != null && executeSync.length > 0) {
            return executeSync[0];
        }
        throw new NoResultException();
    }

    public final CommonGalleryRequestHelper setUseCache(boolean z) {
        this.mBaseGalleryRequest.setUseCache(z);
        return this;
    }
}
