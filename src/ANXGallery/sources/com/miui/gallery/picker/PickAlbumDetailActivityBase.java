package com.miui.gallery.picker;

import android.content.Intent;
import android.database.DataSetObserver;
import android.graphics.Typeface;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.picker.PickAlbumDetailFragmentBase.ItemStateListener;
import com.miui.gallery.picker.PickerActivity.Decor;
import com.miui.gallery.picker.helper.Picker;
import com.miui.gallery.picker.helper.Picker.MediaType;
import com.miui.gallery.picker.helper.Picker.Mode;
import com.miui.gallery.picker.helper.Picker.ResultType;
import com.miui.gallery.util.BuildUtil;
import java.util.ArrayList;
import miui.app.ActionBar;
import miui.gallery.support.MiuiSdkCompat;

public class PickAlbumDetailActivityBase extends PickerActivity {
    protected PickAlbumDetailFragmentBase mAlbumDetailFragment;
    protected ItemStateListener mItemStateListener;
    private int mResultCode;

    public static class SelectAllDecor extends Decor {
        /* access modifiers changed from: private */
        public PickAlbumDetailActivityBase mActivity;
        /* access modifiers changed from: private */
        public boolean mAllSelected;
        private Button mCancelButton;
        private Button mDoneButton;
        private TextView mPickerTitle;
        private Button mSelectAllButton;
        private TextView mTitle;

        protected SelectAllDecor(PickAlbumDetailActivityBase pickAlbumDetailActivityBase) {
            super(pickAlbumDetailActivityBase);
            this.mActivity = pickAlbumDetailActivityBase;
        }

        /* JADX WARNING: type inference failed for: r0v0, types: [android.content.Context, com.miui.gallery.picker.PickAlbumDetailActivityBase] */
        /* JADX WARNING: type inference failed for: r0v1, types: [android.content.Context, com.miui.gallery.picker.PickAlbumDetailActivityBase] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [android.content.Context, com.miui.gallery.picker.PickAlbumDetailActivityBase]
  assigns: [com.miui.gallery.picker.PickAlbumDetailActivityBase]
  uses: [android.content.Context]
  mth insns count: 27
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 2 */
        private void setup() {
            MiuiSdkCompat.setEditActionModeButton(this.mActivity, this.mDoneButton, 2);
            MiuiSdkCompat.setEditActionModeButton(this.mActivity, this.mCancelButton, 3);
            Picker picker = this.mActivity.getPicker();
            this.mTitle.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    SelectAllDecor.this.mActivity.setResultCode(2);
                    SelectAllDecor.this.mActivity.getPicker().done();
                }
            });
            this.mCancelButton.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    SelectAllDecor.this.mActivity.getPicker().cancel();
                }
            });
            this.mDoneButton.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    SelectAllDecor.this.mActivity.setResultCode(-1);
                    SelectAllDecor.this.mActivity.getPicker().done();
                }
            });
            this.mSelectAllButton.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    if (SelectAllDecor.this.mAllSelected) {
                        SelectAllDecor.this.mActivity.mAlbumDetailFragment.clear();
                    } else {
                        SelectAllDecor.this.mActivity.mAlbumDetailFragment.selectAll();
                    }
                }
            });
            updateSelectAll();
            picker.registerObserver(new DataSetObserver() {
                public void onChanged() {
                    super.onChanged();
                    SelectAllDecor.this.mActivity.updateTitle();
                    SelectAllDecor.this.updateDoneButtonVisibility();
                }

                public void onInvalidated() {
                    super.onInvalidated();
                    SelectAllDecor.this.mActivity.updateTitle();
                    SelectAllDecor.this.updateDoneButtonVisibility();
                }
            });
            this.mActivity.mItemStateListener = new ItemStateListener() {
                public void onStateChanged() {
                    SelectAllDecor.this.updateSelectAll();
                }
            };
        }

        /* access modifiers changed from: private */
        public void updateDoneButtonVisibility() {
            this.mDoneButton.setEnabled(this.mActivity.mPicker.count() >= this.mActivity.mPicker.baseline());
        }

        /* JADX WARNING: type inference failed for: r0v3, types: [android.content.Context, com.miui.gallery.picker.PickAlbumDetailActivityBase] */
        /* access modifiers changed from: private */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v3, types: [android.content.Context, com.miui.gallery.picker.PickAlbumDetailActivityBase]
  assigns: [com.miui.gallery.picker.PickAlbumDetailActivityBase]
  uses: [android.content.Context]
  mth insns count: 23
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void updateSelectAll() {
            this.mAllSelected = this.mActivity.mAlbumDetailFragment != null && (this.mActivity.mAlbumDetailFragment.isAllSelected() || (this.mActivity.getPicker().isFull() && !this.mActivity.mAlbumDetailFragment.isNoneSelected()));
            MiuiSdkCompat.setEditActionModeButton(this.mActivity, this.mSelectAllButton, this.mAllSelected);
        }

        /* JADX WARNING: type inference failed for: r2v1, types: [android.content.Context, com.miui.gallery.picker.PickAlbumDetailActivityBase] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v1, types: [android.content.Context, com.miui.gallery.picker.PickAlbumDetailActivityBase]
  assigns: [com.miui.gallery.picker.PickAlbumDetailActivityBase]
  uses: [android.content.Context]
  mth insns count: 32
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public void applyActionBar() {
            ActionBar actionBar = this.mActivity.getActionBar();
            actionBar.setDisplayShowCustomEnabled(true);
            actionBar.setTabsMode(false);
            actionBar.setCustomView(R.layout.picker_album_custom_title);
            View customView = actionBar.getCustomView();
            this.mTitle = (TextView) customView.findViewById(16908310);
            this.mPickerTitle = (TextView) customView.findViewById(R.id.picker_title);
            if (BuildUtil.isInternational()) {
                this.mPickerTitle.setTextAppearance(this.mActivity, 2131820587);
            } else {
                this.mPickerTitle.setTypeface(Typeface.MONOSPACE);
            }
            this.mCancelButton = (Button) customView.findViewById(16908313);
            this.mDoneButton = (Button) customView.findViewById(16908314);
            updateDoneButtonVisibility();
            this.mSelectAllButton = (Button) customView.findViewById(16908315);
            setup();
        }

        public void applyTheme() {
            this.mActivity.setTheme(2131820688);
        }

        public void setPickerTitle(CharSequence charSequence) {
            this.mPickerTitle.setText(charSequence);
        }

        public void setTitle(CharSequence charSequence) {
            this.mTitle.setText(charSequence);
        }
    }

    public void onBackPressed() {
        setResultCode(2);
        getPicker().done();
    }

    /* access modifiers changed from: protected */
    public Decor onCreateDecor() {
        return getPicker().getMode() == Mode.SINGLE ? super.onCreateDecor() : new SelectAllDecor(this);
    }

    /* access modifiers changed from: protected */
    public Picker onCreatePicker() {
        Intent intent = getIntent();
        int intExtra = intent.getIntExtra("pick-upper-bound", 0);
        int intExtra2 = intent.getIntExtra("pick-lower-bound", 1);
        MediaType mediaType = MediaType.values()[intent.getIntExtra("picker_media_type", 0)];
        ArrayList arrayList = (ArrayList) intent.getSerializableExtra("picker_result_set");
        ResultType resultType = ResultType.values()[intent.getIntExtra("picker_result_type", 0)];
        SimplePicker simplePicker = new SimplePicker(this, intExtra, intExtra2, arrayList);
        simplePicker.setMediaType(mediaType);
        simplePicker.setResultType(resultType);
        return simplePicker;
    }

    /* access modifiers changed from: protected */
    public void onDone() {
        Intent intent = new Intent();
        intent.putExtra("internal_key_updated_selection", copyPicker(getPicker()));
        setResult(this.mResultCode, intent);
        finish();
    }

    public void setResultCode(int i) {
        this.mResultCode = i;
    }
}
