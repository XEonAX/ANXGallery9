package com.miui.gallery.util;

import com.miui.gallery.assistant.library.LibraryManager;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;

/* renamed from: com.miui.gallery.util.-$$Lambda$MovieLibraryLoaderHelper$JqYlSH515W9VJVeXikiMLmIyjW4 reason: invalid class name */
/* compiled from: lambda */
public final /* synthetic */ class $$Lambda$MovieLibraryLoaderHelper$JqYlSH515W9VJVeXikiMLmIyjW4 implements ObservableOnSubscribe {
    public static final /* synthetic */ $$Lambda$MovieLibraryLoaderHelper$JqYlSH515W9VJVeXikiMLmIyjW4 INSTANCE = new $$Lambda$MovieLibraryLoaderHelper$JqYlSH515W9VJVeXikiMLmIyjW4();

    private /* synthetic */ $$Lambda$MovieLibraryLoaderHelper$JqYlSH515W9VJVeXikiMLmIyjW4() {
    }

    public final void subscribe(ObservableEmitter observableEmitter) {
        observableEmitter.onNext(new OptionalResult(LibraryManager.getInstance().getLibrarySync(1011)));
    }
}
