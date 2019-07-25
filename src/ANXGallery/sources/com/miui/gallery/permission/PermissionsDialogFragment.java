package com.miui.gallery.permission;

import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.State;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.miui.gallery.agreement.BaseAgreementDialog;
import com.miui.gallery.agreement.core.OnAgreementInvokedListener;
import com.miui.gallery.permission.core.OnPermissionIntroduced;
import com.miui.gallery.permission.core.Permission;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class PermissionsDialogFragment extends DialogFragment implements OnAgreementInvokedListener {
    private OnPermissionIntroduced mOnIntroducedListener;

    private static abstract class BaseViewHolder extends ViewHolder {
        public BaseViewHolder(View view) {
            super(view);
        }

        public static View getView(ViewGroup viewGroup, int i) {
            return LayoutInflater.from(viewGroup.getContext()).inflate(i, viewGroup, false);
        }

        public abstract void bindPermission(PermissionWrapper permissionWrapper);
    }

    private static class CategoryViewHolder extends BaseViewHolder {
        private TextView mCategory;

        public CategoryViewHolder(View view) {
            super(view);
            this.mCategory = (TextView) view.findViewById(R.id.category);
        }

        public void bindPermission(PermissionWrapper permissionWrapper) {
            this.mCategory.setText(this.itemView.getContext().getResources().getString(permissionWrapper.mRequired ? R.string.permission_require_category : R.string.permission_optional_category));
        }
    }

    private static class PermissionDialog extends BaseAgreementDialog {
        private PermissionAdapter mAdapter = new PermissionAdapter();

        private class DividerDecoration extends BaseDividerDecoration {
            private Drawable mSectionDividerDrawable;
            private int mSectionDividerHeight;

            private DividerDecoration() {
            }

            private void init(Context context) {
                if (this.mSectionDividerDrawable == null) {
                    this.mSectionDividerDrawable = context.getResources().getDrawable(R.drawable.section_divider_bg);
                    this.mSectionDividerHeight = context.getResources().getDimensionPixelSize(R.dimen.agreement_section_divider_height);
                }
            }

            /* access modifiers changed from: protected */
            public void drawSection(Canvas canvas, View view, int i, int i2) {
                int top = (int) ((((float) (view.getTop() - ((LayoutParams) view.getLayoutParams()).topMargin)) + view.getTranslationY()) - ((float) this.mSectionDividerHeight));
                this.mSectionDividerDrawable.setBounds(i, top, i2, this.mSectionDividerHeight + top);
                this.mSectionDividerDrawable.draw(canvas);
            }

            public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
                int childAdapterPosition = recyclerView.getChildAdapterPosition(view);
                if (childAdapterPosition > 0) {
                    init(view.getContext());
                    if (((PermissionWrapper) ((PermissionAdapter) recyclerView.getAdapter()).mPermissions.get(childAdapterPosition)).mIsCategory) {
                        rect.set(0, this.mSectionDividerHeight, 0, 0);
                        return;
                    }
                }
                super.getItemOffsets(rect, view, recyclerView, state);
            }

            public void onDrawOver(Canvas canvas, RecyclerView recyclerView, State state) {
                int childCount = recyclerView.getChildCount();
                int paddingStart = recyclerView.getPaddingStart();
                int right = recyclerView.getRight() - recyclerView.getPaddingEnd();
                PermissionAdapter permissionAdapter = (PermissionAdapter) recyclerView.getAdapter();
                for (int i = 0; i < childCount; i++) {
                    View childAt = recyclerView.getChildAt(i);
                    int childAdapterPosition = recyclerView.getChildAdapterPosition(childAt);
                    if (childAdapterPosition != -1) {
                        if (childAdapterPosition <= 0 || !((PermissionWrapper) permissionAdapter.mPermissions.get(childAdapterPosition)).mIsCategory) {
                            drawTop(canvas, childAt, childAdapterPosition == 0 ? paddingStart : this.mPaddingStart + paddingStart, right);
                            if (childAdapterPosition == recyclerView.getAdapter().getItemCount() - 1) {
                                drawBottom(canvas, childAt, paddingStart, right);
                            }
                        } else {
                            drawSection(canvas, childAt, paddingStart, right);
                        }
                    }
                }
            }
        }

        private class PermissionAdapter extends Adapter<BaseViewHolder> {
            /* access modifiers changed from: private */
            public ArrayList<PermissionWrapper> mPermissions;

            private PermissionAdapter() {
                this.mPermissions = new ArrayList<>();
            }

            public int getItemCount() {
                return this.mPermissions.size();
            }

            public int getItemViewType(int i) {
                return ((PermissionWrapper) this.mPermissions.get(i)).mIsCategory ? 1 : 0;
            }

            public void onBindViewHolder(BaseViewHolder baseViewHolder, int i) {
                baseViewHolder.bindPermission((PermissionWrapper) this.mPermissions.get(i));
            }

            public BaseViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
                return i != 1 ? new PermissionViewHolder(BaseViewHolder.getView(viewGroup, R.layout.user_permission_item)) : new CategoryViewHolder(BaseViewHolder.getView(viewGroup, R.layout.user_permission_category));
            }

            public void setPermissions(List<Permission> list) {
                this.mPermissions.clear();
                if (list != null) {
                    LinkedList linkedList = new LinkedList();
                    for (Permission permission : list) {
                        if (permission.mRequired) {
                            this.mPermissions.add(new PermissionWrapper(permission, false));
                        } else {
                            linkedList.add(new PermissionWrapper(permission, false));
                        }
                    }
                    if (!this.mPermissions.isEmpty()) {
                        this.mPermissions.add(0, new PermissionWrapper(new Permission("", "", "", true), true));
                    }
                    if (!linkedList.isEmpty()) {
                        this.mPermissions.add(new PermissionWrapper(new Permission("", "", "", false), true));
                        this.mPermissions.addAll(linkedList);
                    }
                }
                notifyDataSetChanged();
            }
        }

        public PermissionDialog(Context context) {
            super(context, false);
        }

        /* access modifiers changed from: protected */
        public Adapter getAdapter() {
            return this.mAdapter;
        }

        /* access modifiers changed from: protected */
        public CharSequence getButtonText() {
            return getContext().getText(R.string.have_known);
        }

        /* access modifiers changed from: protected */
        public ItemDecoration getDividerDecoration() {
            return new DividerDecoration();
        }

        /* access modifiers changed from: protected */
        public CharSequence getSummary() {
            return getContext().getResources().getString(R.string.permission_use_desc);
        }

        public void setPermissions(List<Permission> list) {
            this.mAdapter.setPermissions(list);
        }
    }

    private static class PermissionViewHolder extends BaseViewHolder {
        private TextView mDesc;
        private TextView mName;

        public PermissionViewHolder(View view) {
            super(view);
            this.mName = (TextView) view.findViewById(R.id.title);
            this.mDesc = (TextView) view.findViewById(R.id.desc);
        }

        public void bindPermission(PermissionWrapper permissionWrapper) {
            this.mName.setText(permissionWrapper.mName);
            this.mDesc.setText(permissionWrapper.mDesc);
        }
    }

    private static class PermissionWrapper extends Permission {
        /* access modifiers changed from: private */
        public final boolean mIsCategory;

        public PermissionWrapper(Permission permission, boolean z) {
            super(permission.mPermissionGroup, permission.mName, permission.mDesc, permission.mRequired);
            this.mIsCategory = z;
        }
    }

    public static PermissionsDialogFragment newInstance(ArrayList<Permission> arrayList, OnPermissionIntroduced onPermissionIntroduced) {
        PermissionsDialogFragment permissionsDialogFragment = new PermissionsDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelableArrayList("extra_permissions", arrayList);
        permissionsDialogFragment.setArguments(bundle);
        permissionsDialogFragment.setOnIntroducedListener(onPermissionIntroduced);
        return permissionsDialogFragment;
    }

    public void onAgreementInvoked(boolean z) {
        if (this.mOnIntroducedListener != null) {
            this.mOnIntroducedListener.onPermissionIntroduced(z);
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setCancelable(false);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        PermissionDialog permissionDialog = new PermissionDialog(getActivity());
        permissionDialog.setOnAgreementListener(this);
        permissionDialog.setPermissions(getArguments().getParcelableArrayList("extra_permissions"));
        return permissionDialog;
    }

    /* access modifiers changed from: 0000 */
    public void setOnIntroducedListener(OnPermissionIntroduced onPermissionIntroduced) {
        this.mOnIntroducedListener = onPermissionIntroduced;
    }
}
