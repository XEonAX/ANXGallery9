package com.miui.gallery.editor.photo.app.filter.skytransfer;

import com.miui.gallery.assistant.library.LibraryManager;
import com.miui.gallery.util.OptionalResult;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;

/* renamed from: com.miui.gallery.editor.photo.app.filter.skytransfer.-$$Lambda$SkyLibraryLoaderHelper$qmL23Q1AG0OUmP05fSaJIcgKCK4 reason: invalid class name */
/* compiled from: lambda */
public final /* synthetic */ class $$Lambda$SkyLibraryLoaderHelper$qmL23Q1AG0OUmP05fSaJIcgKCK4 implements ObservableOnSubscribe {
    public static final /* synthetic */ $$Lambda$SkyLibraryLoaderHelper$qmL23Q1AG0OUmP05fSaJIcgKCK4 INSTANCE = new $$Lambda$SkyLibraryLoaderHelper$qmL23Q1AG0OUmP05fSaJIcgKCK4();

    private /* synthetic */ $$Lambda$SkyLibraryLoaderHelper$qmL23Q1AG0OUmP05fSaJIcgKCK4() {
    }

    public final void subscribe(ObservableEmitter observableEmitter) {
        observableEmitter.onNext(new OptionalResult(LibraryManager.getInstance().getLibrarySync(1012)));
    }
}
