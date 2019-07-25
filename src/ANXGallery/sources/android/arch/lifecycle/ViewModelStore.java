package android.arch.lifecycle;

import java.util.HashMap;

public class ViewModelStore {
    private final HashMap<String, ViewModel> mMap = new HashMap<>();

    public final void clear() {
        for (ViewModel onCleared : this.mMap.values()) {
            onCleared.onCleared();
        }
        this.mMap.clear();
    }
}
