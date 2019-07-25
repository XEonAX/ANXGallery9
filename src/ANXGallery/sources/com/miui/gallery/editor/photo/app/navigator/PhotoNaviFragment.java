package com.miui.gallery.editor.photo.app.navigator;

import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.editor.photo.app.AbstractNaviFragment;
import com.miui.gallery.editor.photo.widgets.overscroll.HorizontalOverScrollBounceEffectDecorator;
import com.miui.gallery.editor.ui.menu.type.EditNavMenuView;
import com.miui.gallery.module.GalleryModuleManager;
import com.miui.gallery.module.GalleryModuleManager.ModuleLoadListener;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.ui.SimpleRecyclerView;
import com.miui.gallery.ui.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.ui.SimpleRecyclerView.OnItemClickListener;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ToastUtils;
import java.util.List;

public class PhotoNaviFragment extends AbstractNaviFragment {
    private Adapter mAdapter;
    private Dialog mDialog;
    private SimpleRecyclerView mNavigator;
    private OnItemClickListener mOnItemSelectedListener = new OnItemClickListener() {
        public boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
            final NavigatorData navigatorData = (NavigatorData) PhotoNaviFragment.this.getNaviData().get(i);
            if (navigatorData.isPlugin) {
                GalleryModuleManager instance = GalleryModuleManager.getInstance();
                if (!instance.isModuleLoaded(navigatorData.pluginModuleName)) {
                    String string = PhotoNaviFragment.this.getString(navigatorData.name);
                    if (instance.isModuleLoading(navigatorData.pluginModuleName)) {
                        ToastUtils.makeText((Context) PhotoNaviFragment.this.getActivity(), (CharSequence) PhotoNaviFragment.this.getString(R.string.photo_editor_navigator_module_downloading, new Object[]{string}));
                        return true;
                    } else if (!NetworkUtils.isNetworkConnected()) {
                        ToastUtils.makeText((Context) PhotoNaviFragment.this.getActivity(), (CharSequence) PhotoNaviFragment.this.getString(R.string.photo_editor_navigator_need_download, new Object[]{string}));
                        return true;
                    } else {
                        if (NetworkUtils.isActiveNetworkMetered()) {
                            PhotoNaviFragment.this.showDialog(PhotoNaviFragment.this.getString(R.string.photo_editor_navigator_download_network_metered_title), PhotoNaviFragment.this.getString(R.string.photo_editor_navigator_download_network_metered_msg, new Object[]{string}), R.string.photo_editor_navigator_module_download_now, R.string.photo_editor_navigator_module_download_wait_wlan, new OnClickListener() {
                                public void onClick(DialogInterface dialogInterface, int i) {
                                    if (!GalleryModuleManager.getInstance().isModuleLoaded(navigatorData.pluginModuleName)) {
                                        PhotoNaviFragment.this.loadEffectModule(navigatorData, false, true);
                                    }
                                }
                            }, null);
                        } else {
                            PhotoNaviFragment.this.loadEffectModule(navigatorData, false, true);
                            ToastUtils.makeText((Context) PhotoNaviFragment.this.getActivity(), (CharSequence) PhotoNaviFragment.this.getString(R.string.photo_editor_navigator_module_downloading, new Object[]{string}));
                        }
                        return true;
                    }
                }
            }
            PhotoNaviFragment.this.notifyNavigate(navigatorData.effect);
            return true;
        }
    };

    private static final class Adapter extends com.miui.gallery.ui.SimpleRecyclerView.Adapter<NavigatorHolder> {
        private List<NavigatorData> mNavigatorData;

        public Adapter(List<NavigatorData> list) {
            this.mNavigatorData = list;
        }

        public int getItemCount() {
            return this.mNavigatorData.size();
        }

        public void onBindViewHolder(NavigatorHolder navigatorHolder, int i) {
            super.onBindViewHolder(navigatorHolder, i);
            navigatorHolder.bind((NavigatorData) this.mNavigatorData.get(i));
        }

        public NavigatorHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new NavigatorHolder(getInflater().inflate(R.layout.common_editor_navigator_item, viewGroup, false));
        }
    }

    private static class EffectModuleLoadListener implements ModuleLoadListener {
        private NavigatorData mNavigatorData;
        private boolean mNotifyResult;

        public EffectModuleLoadListener(NavigatorData navigatorData, boolean z) {
            this.mNavigatorData = navigatorData;
            this.mNotifyResult = z;
        }

        public void onLoadFailed() {
            Log.w("PhotoNaviFragment", "Module %s load failed. Notify result %s", this.mNavigatorData.pluginModuleName, Boolean.valueOf(this.mNotifyResult));
            if (this.mNotifyResult) {
                Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
                Resources resources = sGetAndroidContext.getResources();
                ToastUtils.makeText(sGetAndroidContext, (CharSequence) resources.getString(R.string.photo_editor_navigator_module_download_failed, new Object[]{resources.getString(this.mNavigatorData.name)}));
            }
        }

        public void onLoadSuccess() {
            Log.d("PhotoNaviFragment", "Module %s load success", (Object) this.mNavigatorData.pluginModuleName);
        }
    }

    private static final class NavigatorHolder extends ViewHolder {
        private ImageView mImageView;
        private TextView mView;

        public NavigatorHolder(View view) {
            super(view);
            this.mView = (TextView) view.findViewById(R.id.label);
            this.mImageView = (ImageView) view.findViewById(R.id.img_nav);
        }

        /* access modifiers changed from: 0000 */
        public void bind(NavigatorData navigatorData) {
            this.mView.setText(navigatorData.name);
            this.mImageView.setImageResource(navigatorData.icon);
        }
    }

    private void checkAndLoadEffectModule() {
        GalleryModuleManager instance = GalleryModuleManager.getInstance();
        for (NavigatorData navigatorData : getNaviData()) {
            if (navigatorData.isPlugin) {
                String str = navigatorData.pluginModuleName;
                if (!instance.isModuleLoaded(str) && !instance.isModuleLoading(str)) {
                    loadEffectModule(navigatorData, !NetworkUtils.isNetworkConnected() || NetworkUtils.isActiveNetworkMetered(), false);
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void loadEffectModule(final NavigatorData navigatorData, final boolean z, final boolean z2) {
        ThreadManager.getMiscPool().submit(new Job<Object>() {
            public Object run(JobContext jobContext) {
                Log.d("PhotoNaviFragment", "Module %s load start", (Object) navigatorData.pluginModuleName);
                GalleryModuleManager.getInstance().loadModule(z, new EffectModuleLoadListener(navigatorData, z2), navigatorData.pluginModuleName);
                return null;
            }
        });
    }

    /* access modifiers changed from: private */
    public void showDialog(String str, String str2, int i, int i2, OnClickListener onClickListener, OnClickListener onClickListener2) {
        if (this.mDialog != null) {
            this.mDialog.dismiss();
        }
        this.mDialog = new Builder(getActivity()).setTitle(str).setMessage(str2).setPositiveButton(i, onClickListener).setNegativeButton(i2, onClickListener2).create();
        this.mDialog.show();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        checkAndLoadEffectModule();
    }

    /* access modifiers changed from: protected */
    public View onCreateNavigator(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return new EditNavMenuView(viewGroup.getContext());
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mDialog != null) {
            this.mDialog.dismiss();
            this.mDialog = null;
        }
    }

    public void onDestroyView() {
        super.onDestroyView();
        getView().findViewById(R.id.export).setOnClickListener(null);
        getView().findViewById(R.id.discard).setOnClickListener(null);
    }

    /* access modifiers changed from: protected */
    public void onNavigatorCreated(View view, Bundle bundle) {
        super.onNavigatorCreated(view, bundle);
        this.mNavigator = (SimpleRecyclerView) view.findViewById(R.id.recycler_view);
        this.mAdapter = new Adapter(getNaviData());
        this.mNavigator.setAdapter(this.mAdapter);
        this.mAdapter.setOnItemClickListener(this.mOnItemSelectedListener);
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.photo_editor_nav_item_start);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.photo_editor_nav_item_horizontal_interval);
        SimpleRecyclerView simpleRecyclerView = this.mNavigator;
        BlankDivider blankDivider = new BlankDivider(dimensionPixelSize, dimensionPixelSize, dimensionPixelSize2, 0, 0, 0);
        simpleRecyclerView.addItemDecoration(blankDivider);
        HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(this.mNavigator);
    }
}
