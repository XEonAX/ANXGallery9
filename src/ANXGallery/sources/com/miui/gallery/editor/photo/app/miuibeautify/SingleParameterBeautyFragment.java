package com.miui.gallery.editor.photo.app.miuibeautify;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.TextView;
import com.miui.filtersdk.beauty.BeautyProcessorManager;
import com.miui.filtersdk.beauty.IntelligentBeautyProcessor;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.imports.miuibeauty.MiuiBeautyEffect;
import com.miui.gallery.editor.photo.widgets.seekbar.BubbleIndicator;
import com.miui.gallery.editor.photo.widgets.seekbar.BubbleIndicator.Callback;

public class SingleParameterBeautyFragment extends ChildMenuFragment {
    private Callback<TextView> mIndicatorCallback = new Callback<TextView>() {
        public void updateProgress(TextView textView, int i) {
            textView.setText(String.valueOf(i));
        }
    };
    private SeekBar mSeekBar;
    private OnSeekBarChangeListener mSeekBarChangeListener = new OnSeekBarChangeListener() {
        public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
        }

        public void onStartTrackingTouch(SeekBar seekBar) {
        }

        public void onStopTrackingTouch(SeekBar seekBar) {
            IntelligentBeautyProcessor beautyProcessor = BeautyProcessorManager.INSTANCE.getBeautyProcessor();
            Bundle arguments = SingleParameterBeautyFragment.this.getArguments();
            if (arguments != null) {
                MiuiBeautyEffect miuiBeautyEffect = (MiuiBeautyEffect) arguments.getParcelable("BEAUTY_EFFECT");
                if (miuiBeautyEffect != null) {
                    float[] supportedParamRange = beautyProcessor.getSupportedParamRange(miuiBeautyEffect.mBeautyType);
                    if (supportedParamRange != null && supportedParamRange.length >= 2) {
                        SingleParameterBeautyFragment.this.setBeautyParameterTable(miuiBeautyEffect.mBeautyType, (((float) seekBar.getProgress()) / 100.0f) * (supportedParamRange[1] - supportedParamRange[0]));
                        SingleParameterBeautyFragment.this.notifyBeautyParameterChanged();
                    }
                }
            }
        }
    };

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.miuibeauty_single_param_fragment, viewGroup, false);
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mSeekBar = (SeekBar) view.findViewById(R.id.seekbar);
        this.mSeekBar.setOnSeekBarChangeListener(this.mSeekBarChangeListener);
        this.mSeekBar.setOnSeekBarChangeListener(new BubbleIndicator((TextView) View.inflate(getActivity(), R.layout.seekbar_bubble_indicator_text, null), getActivity().getResources().getDimensionPixelSize(R.dimen.photo_editor_bubble_indicator_offset), this.mIndicatorCallback, this.mSeekBarChangeListener));
    }
}
