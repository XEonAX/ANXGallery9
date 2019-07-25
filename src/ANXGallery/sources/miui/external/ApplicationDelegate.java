package miui.external;

import android.content.ComponentCallbacks;
import android.content.ComponentCallbacks2;
import android.content.ContextWrapper;
import android.content.res.Configuration;

public abstract class ApplicationDelegate extends ContextWrapper implements ComponentCallbacks2 {
    private Application mApplication;

    public ApplicationDelegate() {
        super(null);
    }

    /* access modifiers changed from: 0000 */
    public void attach(Application application) {
        this.mApplication = application;
        attachBaseContext(application);
    }

    public void onConfigurationChanged(Configuration configuration) {
        this.mApplication.superOnConfigurationChanged(configuration);
    }

    public void onCreate() {
        this.mApplication.superOnCreate();
    }

    public void onLowMemory() {
        this.mApplication.superOnLowMemory();
    }

    public void onTerminate() {
        this.mApplication.superOnTerminate();
    }

    public void onTrimMemory(int i) {
        this.mApplication.superOnTrimMemory(i);
    }

    public void registerComponentCallbacks(ComponentCallbacks componentCallbacks) {
        this.mApplication.registerComponentCallbacks(componentCallbacks);
    }

    public void unregisterComponentCallbacks(ComponentCallbacks componentCallbacks) {
        this.mApplication.unregisterComponentCallbacks(componentCallbacks);
    }
}
