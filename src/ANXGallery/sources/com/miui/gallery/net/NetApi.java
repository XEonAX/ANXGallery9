package com.miui.gallery.net;

import com.miui.gallery.net.base.ErrorCode;
import com.miui.gallery.net.base.ResponseListener;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.OptionalResult;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;

public class NetApi {
    public static <T> Observable<OptionalResult<T>> create(final BaseGalleryRequest baseGalleryRequest) {
        return Observable.create(new ObservableOnSubscribe<OptionalResult<T>>() {
            public void subscribe(final ObservableEmitter<OptionalResult<T>> observableEmitter) throws Exception {
                baseGalleryRequest.execute(new ResponseListener() {
                    public void onResponse(Object... objArr) {
                        observableEmitter.onNext(new OptionalResult(objArr[0]));
                        Log.d("NetApi", String.format("%s onResponseSuccess", new Object[]{baseGalleryRequest.getClass().getSimpleName()}));
                    }

                    public void onResponseError(ErrorCode errorCode, String str, Object obj) {
                        observableEmitter.onNext(new OptionalResult(null));
                        Log.d("NetApi", String.format("%s onResponseError", new Object[]{baseGalleryRequest.getClass().getSimpleName()}));
                    }
                });
            }
        });
    }
}
