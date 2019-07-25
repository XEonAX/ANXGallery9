package com.miui.gallery.agreement;

import android.app.Activity;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.TextView;
import com.miui.gallery.agreement.core.Agreement;
import com.miui.gallery.agreement.core.OnAgreementInvokedListener;
import com.miui.gallery.permission.R;
import java.util.ArrayList;
import java.util.List;

public class AgreementDialogFragment extends DialogFragment {
    private OnAgreementInvokedListener mListener;

    private static class AgreementDialog extends BaseAgreementDialog {
        private AgreementAdapter mAdapter = new AgreementAdapter();

        private class AgreementAdapter extends Adapter<AgreementViewHolder> implements OnCheckChangedListener {
            private List<AgreementWrapper> mAgreements;

            private AgreementAdapter() {
                this.mAgreements = new ArrayList();
            }

            public int getItemCount() {
                return this.mAgreements.size();
            }

            public void onBindViewHolder(AgreementViewHolder agreementViewHolder, int i) {
                agreementViewHolder.bindAgreement((AgreementWrapper) this.mAgreements.get(i), this);
            }

            public void onCheckChanged(AgreementWrapper agreementWrapper) {
                boolean z;
                boolean z2 = true;
                if (agreementWrapper.isSelectItem) {
                    z = false;
                    for (AgreementWrapper agreementWrapper2 : this.mAgreements) {
                        if (agreementWrapper2.mChecked != agreementWrapper.mChecked) {
                            agreementWrapper2.mChecked = agreementWrapper.mChecked;
                            z = true;
                        }
                    }
                } else {
                    AgreementWrapper agreementWrapper3 = null;
                    boolean z3 = true;
                    for (AgreementWrapper agreementWrapper4 : this.mAgreements) {
                        if (agreementWrapper4.isSelectItem) {
                            agreementWrapper3 = agreementWrapper4;
                        } else if (agreementWrapper.mChecked != agreementWrapper4.mChecked) {
                            z3 = false;
                        }
                    }
                    if (z3) {
                        z = agreementWrapper3.mChecked != agreementWrapper.mChecked;
                        agreementWrapper3.mChecked = agreementWrapper.mChecked;
                    } else {
                        z = agreementWrapper3.mChecked;
                        agreementWrapper3.mChecked = false;
                    }
                }
                if (z) {
                    notifyDataSetChanged();
                }
                for (AgreementWrapper agreementWrapper5 : this.mAgreements) {
                    if (agreementWrapper5.mRequired && !agreementWrapper5.mChecked) {
                        z2 = false;
                    }
                }
                AgreementDialog.this.setActionButtonEnabled(z2);
            }

            public AgreementViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
                return new AgreementViewHolder(AgreementViewHolder.getView(viewGroup, R.layout.user_agreement_item));
            }

            public void setAgreements(List<Agreement> list) {
                this.mAgreements.clear();
                if (list != null) {
                    for (Agreement agreementWrapper : list) {
                        AgreementWrapper agreementWrapper2 = new AgreementWrapper(agreementWrapper, false);
                        agreementWrapper2.mChecked = true;
                        this.mAgreements.add(agreementWrapper2);
                    }
                    if (!this.mAgreements.isEmpty()) {
                        AgreementWrapper agreementWrapper3 = new AgreementWrapper(new Agreement(AgreementDialog.this.getContext().getResources().getString(R.string.select_all), null, false), true);
                        agreementWrapper3.mChecked = true;
                        this.mAgreements.add(0, agreementWrapper3);
                    }
                }
                notifyDataSetChanged();
            }
        }

        public AgreementDialog(Context context) {
            super(context, true);
        }

        /* access modifiers changed from: protected */
        public Adapter getAdapter() {
            return this.mAdapter;
        }

        /* access modifiers changed from: protected */
        public CharSequence getSummary() {
            return getContext().getResources().getString(R.string.agreement_summary);
        }

        public void setAgreements(List<Agreement> list) {
            this.mAdapter.setAgreements(list);
        }
    }

    private static class AgreementViewHolder extends ViewHolder implements OnClickListener {
        private AgreementWrapper mAgreement;
        CheckBox mCheckBox;
        private OnCheckChangedListener mCheckChangedListener;
        TextView mText;

        private interface OnCheckChangedListener {
            void onCheckChanged(AgreementWrapper agreementWrapper);
        }

        public AgreementViewHolder(View view) {
            super(view);
            this.mText = (TextView) view.findViewById(R.id.title);
            this.mCheckBox = (CheckBox) view.findViewById(R.id.checkbox);
        }

        public static View getView(ViewGroup viewGroup, int i) {
            return LayoutInflater.from(viewGroup.getContext()).inflate(i, viewGroup, false);
        }

        private CharSequence parseAgreementText(AgreementWrapper agreementWrapper) {
            StringBuilder sb = new StringBuilder();
            sb.append(agreementWrapper.mText);
            if (!agreementWrapper.isSelectItem) {
                sb.append(" ");
                Resources resources = this.itemView.getContext().getResources();
                if (agreementWrapper.mRequired) {
                    sb.append(resources.getString(R.string.agreement_required_tip));
                } else {
                    sb.append(resources.getString(R.string.agreement_optional_tip));
                }
            }
            return sb.toString();
        }

        public void bindAgreement(AgreementWrapper agreementWrapper, OnCheckChangedListener onCheckChangedListener) {
            this.mAgreement = agreementWrapper;
            this.mText.setText(parseAgreementText(agreementWrapper));
            Resources resources = this.itemView.getContext().getResources();
            if (!TextUtils.isEmpty(agreementWrapper.mLink)) {
                this.mText.setCompoundDrawablePadding(resources.getDimensionPixelSize(R.dimen.agreement_item_arrow_padding));
                this.mText.setCompoundDrawablesRelativeWithIntrinsicBounds(null, null, this.itemView.getContext().getDrawable(miui.R.drawable.arrow_right), null);
            } else {
                this.mText.setCompoundDrawablesRelativeWithIntrinsicBounds(null, null, null, null);
            }
            if (agreementWrapper.isSelectItem) {
                this.mText.setTextAppearance(this.itemView.getContext(), R.style.TextAppearance_PreferenceList);
            } else {
                this.mText.setTextAppearance(this.itemView.getContext(), R.style.TextAppearance_Agreement);
            }
            if (TextUtils.isEmpty(agreementWrapper.mLink)) {
                this.mText.setOnClickListener(null);
            } else {
                this.mText.setOnClickListener(this);
            }
            this.mCheckBox.setChecked(agreementWrapper.mChecked);
            this.mCheckBox.setOnClickListener(this);
            this.mCheckChangedListener = onCheckChangedListener;
        }

        public void onClick(View view) {
            if (view.getId() == R.id.title) {
                AgreementsUtils.viewAgreement(view.getContext(), this.mAgreement);
            }
            if (view.getId() == R.id.checkbox) {
                this.mAgreement.mChecked = this.mCheckBox.isChecked();
                if (this.mCheckChangedListener != null) {
                    this.mCheckChangedListener.onCheckChanged(this.mAgreement);
                }
            }
        }
    }

    private static class AgreementWrapper extends Agreement {
        /* access modifiers changed from: private */
        public final boolean isSelectItem;
        /* access modifiers changed from: private */
        public boolean mChecked;

        public AgreementWrapper(Agreement agreement, boolean z) {
            super(agreement.mText, agreement.mLink, agreement.mRequired);
            this.isSelectItem = z;
        }
    }

    public static AgreementDialogFragment newInstance(ArrayList<Agreement> arrayList) {
        AgreementDialogFragment agreementDialogFragment = new AgreementDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putParcelableArrayList("extra_agreements", arrayList);
        agreementDialogFragment.setArguments(bundle);
        return agreementDialogFragment;
    }

    public void invoke(Activity activity, OnAgreementInvokedListener onAgreementInvokedListener) {
        this.mListener = onAgreementInvokedListener;
        show(activity.getFragmentManager(), "AgreementDialogFragment");
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setCancelable(false);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        AgreementDialog agreementDialog = new AgreementDialog(getActivity());
        agreementDialog.setOnAgreementListener(this.mListener);
        agreementDialog.setAgreements(getArguments().getParcelableArrayList("extra_agreements"));
        return agreementDialog;
    }
}
