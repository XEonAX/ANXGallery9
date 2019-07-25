package android.support.constraint;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources.NotFoundException;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.os.Build.VERSION;
import android.support.constraint.solver.Metrics;
import android.support.constraint.solver.widgets.Analyzer;
import android.support.constraint.solver.widgets.ConstraintAnchor.Strength;
import android.support.constraint.solver.widgets.ConstraintAnchor.Type;
import android.support.constraint.solver.widgets.ConstraintWidget;
import android.support.constraint.solver.widgets.ConstraintWidget.DimensionBehaviour;
import android.support.constraint.solver.widgets.ConstraintWidgetContainer;
import android.support.constraint.solver.widgets.Guideline;
import android.support.constraint.solver.widgets.ResolutionAnchor;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.util.SparseIntArray;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import com.nexstreaming.nexeditorsdk.nexEngine;
import java.util.ArrayList;
import java.util.HashMap;

public class ConstraintLayout extends ViewGroup {
    SparseArray<View> mChildrenByIds = new SparseArray<>();
    private ArrayList<ConstraintHelper> mConstraintHelpers = new ArrayList<>(4);
    private ConstraintSet mConstraintSet = null;
    private int mConstraintSetId = -1;
    private HashMap<String, Integer> mDesignIds = new HashMap<>();
    private boolean mDirtyHierarchy = true;
    private int mLastMeasureHeight = -1;
    int mLastMeasureHeightMode = 0;
    int mLastMeasureHeightSize = -1;
    private int mLastMeasureWidth = -1;
    int mLastMeasureWidthMode = 0;
    int mLastMeasureWidthSize = -1;
    ConstraintWidgetContainer mLayoutWidget = new ConstraintWidgetContainer();
    private int mMaxHeight = Integer.MAX_VALUE;
    private int mMaxWidth = Integer.MAX_VALUE;
    private Metrics mMetrics;
    private int mMinHeight = 0;
    private int mMinWidth = 0;
    private int mOptimizationLevel = 7;
    private final ArrayList<ConstraintWidget> mVariableDimensionsWidgets = new ArrayList<>(100);

    public static class LayoutParams extends MarginLayoutParams {
        public int baselineToBaseline = -1;
        public int bottomToBottom = -1;
        public int bottomToTop = -1;
        public float circleAngle = 0.0f;
        public int circleConstraint = -1;
        public int circleRadius = 0;
        public boolean constrainedHeight = false;
        public boolean constrainedWidth = false;
        public String dimensionRatio = null;
        int dimensionRatioSide = 1;
        float dimensionRatioValue = 0.0f;
        public int editorAbsoluteX = -1;
        public int editorAbsoluteY = -1;
        public int endToEnd = -1;
        public int endToStart = -1;
        public int goneBottomMargin = -1;
        public int goneEndMargin = -1;
        public int goneLeftMargin = -1;
        public int goneRightMargin = -1;
        public int goneStartMargin = -1;
        public int goneTopMargin = -1;
        public int guideBegin = -1;
        public int guideEnd = -1;
        public float guidePercent = -1.0f;
        public boolean helped = false;
        public float horizontalBias = 0.5f;
        public int horizontalChainStyle = 0;
        boolean horizontalDimensionFixed = true;
        public float horizontalWeight = -1.0f;
        boolean isGuideline = false;
        boolean isHelper = false;
        boolean isInPlaceholder = false;
        public int leftToLeft = -1;
        public int leftToRight = -1;
        public int matchConstraintDefaultHeight = 0;
        public int matchConstraintDefaultWidth = 0;
        public int matchConstraintMaxHeight = 0;
        public int matchConstraintMaxWidth = 0;
        public int matchConstraintMinHeight = 0;
        public int matchConstraintMinWidth = 0;
        public float matchConstraintPercentHeight = 1.0f;
        public float matchConstraintPercentWidth = 1.0f;
        boolean needsBaseline = false;
        public int orientation = -1;
        int resolveGoneLeftMargin = -1;
        int resolveGoneRightMargin = -1;
        int resolvedGuideBegin;
        int resolvedGuideEnd;
        float resolvedGuidePercent;
        float resolvedHorizontalBias = 0.5f;
        int resolvedLeftToLeft = -1;
        int resolvedLeftToRight = -1;
        int resolvedRightToLeft = -1;
        int resolvedRightToRight = -1;
        public int rightToLeft = -1;
        public int rightToRight = -1;
        public int startToEnd = -1;
        public int startToStart = -1;
        public int topToBottom = -1;
        public int topToTop = -1;
        public float verticalBias = 0.5f;
        public int verticalChainStyle = 0;
        boolean verticalDimensionFixed = true;
        public float verticalWeight = -1.0f;
        ConstraintWidget widget = new ConstraintWidget();

        private static class Table {
            public static final SparseIntArray map = new SparseIntArray();

            static {
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintLeft_toLeftOf, 8);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintLeft_toRightOf, 9);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintRight_toLeftOf, 10);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintRight_toRightOf, 11);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintTop_toTopOf, 12);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintTop_toBottomOf, 13);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintBottom_toTopOf, 14);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintBottom_toBottomOf, 15);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintBaseline_toBaselineOf, 16);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintCircle, 2);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintCircleRadius, 3);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintCircleAngle, 4);
                map.append(R.styleable.ConstraintLayout_Layout_layout_editor_absoluteX, 49);
                map.append(R.styleable.ConstraintLayout_Layout_layout_editor_absoluteY, 50);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintGuide_begin, 5);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintGuide_end, 6);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintGuide_percent, 7);
                map.append(R.styleable.ConstraintLayout_Layout_android_orientation, 1);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintStart_toEndOf, 17);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintStart_toStartOf, 18);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintEnd_toStartOf, 19);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintEnd_toEndOf, 20);
                map.append(R.styleable.ConstraintLayout_Layout_layout_goneMarginLeft, 21);
                map.append(R.styleable.ConstraintLayout_Layout_layout_goneMarginTop, 22);
                map.append(R.styleable.ConstraintLayout_Layout_layout_goneMarginRight, 23);
                map.append(R.styleable.ConstraintLayout_Layout_layout_goneMarginBottom, 24);
                map.append(R.styleable.ConstraintLayout_Layout_layout_goneMarginStart, 25);
                map.append(R.styleable.ConstraintLayout_Layout_layout_goneMarginEnd, 26);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintHorizontal_bias, 29);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintVertical_bias, 30);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintDimensionRatio, 44);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintHorizontal_weight, 45);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintVertical_weight, 46);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintHorizontal_chainStyle, 47);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintVertical_chainStyle, 48);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constrainedWidth, 27);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constrainedHeight, 28);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintWidth_default, 31);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintHeight_default, 32);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintWidth_min, 33);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintWidth_max, 34);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintWidth_percent, 35);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintHeight_min, 36);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintHeight_max, 37);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintHeight_percent, 38);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintLeft_creator, 39);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintTop_creator, 40);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintRight_creator, 41);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintBottom_creator, 42);
                map.append(R.styleable.ConstraintLayout_Layout_layout_constraintBaseline_creator, 43);
            }
        }

        public LayoutParams(int i, int i2) {
            super(i, i2);
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            int i;
            super(context, attributeSet);
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.ConstraintLayout_Layout);
            int indexCount = obtainStyledAttributes.getIndexCount();
            for (int i2 = 0; i2 < indexCount; i2++) {
                int index = obtainStyledAttributes.getIndex(i2);
                switch (Table.map.get(index)) {
                    case 1:
                        this.orientation = obtainStyledAttributes.getInt(index, this.orientation);
                        break;
                    case 2:
                        this.circleConstraint = obtainStyledAttributes.getResourceId(index, this.circleConstraint);
                        if (this.circleConstraint != -1) {
                            break;
                        } else {
                            this.circleConstraint = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 3:
                        this.circleRadius = obtainStyledAttributes.getDimensionPixelSize(index, this.circleRadius);
                        break;
                    case 4:
                        this.circleAngle = obtainStyledAttributes.getFloat(index, this.circleAngle) % 360.0f;
                        if (this.circleAngle >= 0.0f) {
                            break;
                        } else {
                            this.circleAngle = (360.0f - this.circleAngle) % 360.0f;
                            break;
                        }
                    case 5:
                        this.guideBegin = obtainStyledAttributes.getDimensionPixelOffset(index, this.guideBegin);
                        break;
                    case 6:
                        this.guideEnd = obtainStyledAttributes.getDimensionPixelOffset(index, this.guideEnd);
                        break;
                    case 7:
                        this.guidePercent = obtainStyledAttributes.getFloat(index, this.guidePercent);
                        break;
                    case 8:
                        this.leftToLeft = obtainStyledAttributes.getResourceId(index, this.leftToLeft);
                        if (this.leftToLeft != -1) {
                            break;
                        } else {
                            this.leftToLeft = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 9:
                        this.leftToRight = obtainStyledAttributes.getResourceId(index, this.leftToRight);
                        if (this.leftToRight != -1) {
                            break;
                        } else {
                            this.leftToRight = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 10:
                        this.rightToLeft = obtainStyledAttributes.getResourceId(index, this.rightToLeft);
                        if (this.rightToLeft != -1) {
                            break;
                        } else {
                            this.rightToLeft = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 11:
                        this.rightToRight = obtainStyledAttributes.getResourceId(index, this.rightToRight);
                        if (this.rightToRight != -1) {
                            break;
                        } else {
                            this.rightToRight = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 12:
                        this.topToTop = obtainStyledAttributes.getResourceId(index, this.topToTop);
                        if (this.topToTop != -1) {
                            break;
                        } else {
                            this.topToTop = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 13:
                        this.topToBottom = obtainStyledAttributes.getResourceId(index, this.topToBottom);
                        if (this.topToBottom != -1) {
                            break;
                        } else {
                            this.topToBottom = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 14:
                        this.bottomToTop = obtainStyledAttributes.getResourceId(index, this.bottomToTop);
                        if (this.bottomToTop != -1) {
                            break;
                        } else {
                            this.bottomToTop = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 15:
                        this.bottomToBottom = obtainStyledAttributes.getResourceId(index, this.bottomToBottom);
                        if (this.bottomToBottom != -1) {
                            break;
                        } else {
                            this.bottomToBottom = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 16:
                        this.baselineToBaseline = obtainStyledAttributes.getResourceId(index, this.baselineToBaseline);
                        if (this.baselineToBaseline != -1) {
                            break;
                        } else {
                            this.baselineToBaseline = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 17:
                        this.startToEnd = obtainStyledAttributes.getResourceId(index, this.startToEnd);
                        if (this.startToEnd != -1) {
                            break;
                        } else {
                            this.startToEnd = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 18:
                        this.startToStart = obtainStyledAttributes.getResourceId(index, this.startToStart);
                        if (this.startToStart != -1) {
                            break;
                        } else {
                            this.startToStart = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 19:
                        this.endToStart = obtainStyledAttributes.getResourceId(index, this.endToStart);
                        if (this.endToStart != -1) {
                            break;
                        } else {
                            this.endToStart = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 20:
                        this.endToEnd = obtainStyledAttributes.getResourceId(index, this.endToEnd);
                        if (this.endToEnd != -1) {
                            break;
                        } else {
                            this.endToEnd = obtainStyledAttributes.getInt(index, -1);
                            break;
                        }
                    case 21:
                        this.goneLeftMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.goneLeftMargin);
                        break;
                    case 22:
                        this.goneTopMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.goneTopMargin);
                        break;
                    case 23:
                        this.goneRightMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.goneRightMargin);
                        break;
                    case 24:
                        this.goneBottomMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.goneBottomMargin);
                        break;
                    case 25:
                        this.goneStartMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.goneStartMargin);
                        break;
                    case 26:
                        this.goneEndMargin = obtainStyledAttributes.getDimensionPixelSize(index, this.goneEndMargin);
                        break;
                    case 27:
                        this.constrainedWidth = obtainStyledAttributes.getBoolean(index, this.constrainedWidth);
                        break;
                    case 28:
                        this.constrainedHeight = obtainStyledAttributes.getBoolean(index, this.constrainedHeight);
                        break;
                    case 29:
                        this.horizontalBias = obtainStyledAttributes.getFloat(index, this.horizontalBias);
                        break;
                    case 30:
                        this.verticalBias = obtainStyledAttributes.getFloat(index, this.verticalBias);
                        break;
                    case 31:
                        this.matchConstraintDefaultWidth = obtainStyledAttributes.getInt(index, 0);
                        if (this.matchConstraintDefaultWidth != 1) {
                            break;
                        } else {
                            Log.e("ConstraintLayout", "layout_constraintWidth_default=\"wrap\" is deprecated.\nUse layout_width=\"WRAP_CONTENT\" and layout_constrainedWidth=\"true\" instead.");
                            break;
                        }
                    case 32:
                        this.matchConstraintDefaultHeight = obtainStyledAttributes.getInt(index, 0);
                        if (this.matchConstraintDefaultHeight != 1) {
                            break;
                        } else {
                            Log.e("ConstraintLayout", "layout_constraintHeight_default=\"wrap\" is deprecated.\nUse layout_height=\"WRAP_CONTENT\" and layout_constrainedHeight=\"true\" instead.");
                            break;
                        }
                    case 33:
                        try {
                            this.matchConstraintMinWidth = obtainStyledAttributes.getDimensionPixelSize(index, this.matchConstraintMinWidth);
                            break;
                        } catch (Exception unused) {
                            if (obtainStyledAttributes.getInt(index, this.matchConstraintMinWidth) != -2) {
                                break;
                            } else {
                                this.matchConstraintMinWidth = -2;
                                break;
                            }
                        }
                    case 34:
                        try {
                            this.matchConstraintMaxWidth = obtainStyledAttributes.getDimensionPixelSize(index, this.matchConstraintMaxWidth);
                            break;
                        } catch (Exception unused2) {
                            if (obtainStyledAttributes.getInt(index, this.matchConstraintMaxWidth) != -2) {
                                break;
                            } else {
                                this.matchConstraintMaxWidth = -2;
                                break;
                            }
                        }
                    case 35:
                        this.matchConstraintPercentWidth = Math.max(0.0f, obtainStyledAttributes.getFloat(index, this.matchConstraintPercentWidth));
                        break;
                    case 36:
                        try {
                            this.matchConstraintMinHeight = obtainStyledAttributes.getDimensionPixelSize(index, this.matchConstraintMinHeight);
                            break;
                        } catch (Exception unused3) {
                            if (obtainStyledAttributes.getInt(index, this.matchConstraintMinHeight) != -2) {
                                break;
                            } else {
                                this.matchConstraintMinHeight = -2;
                                break;
                            }
                        }
                    case 37:
                        try {
                            this.matchConstraintMaxHeight = obtainStyledAttributes.getDimensionPixelSize(index, this.matchConstraintMaxHeight);
                            break;
                        } catch (Exception unused4) {
                            if (obtainStyledAttributes.getInt(index, this.matchConstraintMaxHeight) != -2) {
                                break;
                            } else {
                                this.matchConstraintMaxHeight = -2;
                                break;
                            }
                        }
                    case 38:
                        this.matchConstraintPercentHeight = Math.max(0.0f, obtainStyledAttributes.getFloat(index, this.matchConstraintPercentHeight));
                        break;
                    case 44:
                        this.dimensionRatio = obtainStyledAttributes.getString(index);
                        this.dimensionRatioValue = Float.NaN;
                        this.dimensionRatioSide = -1;
                        if (this.dimensionRatio == null) {
                            break;
                        } else {
                            int length = this.dimensionRatio.length();
                            int indexOf = this.dimensionRatio.indexOf(44);
                            if (indexOf <= 0 || indexOf >= length - 1) {
                                i = 0;
                            } else {
                                String substring = this.dimensionRatio.substring(0, indexOf);
                                if (substring.equalsIgnoreCase("W")) {
                                    this.dimensionRatioSide = 0;
                                } else if (substring.equalsIgnoreCase("H")) {
                                    this.dimensionRatioSide = 1;
                                }
                                i = indexOf + 1;
                            }
                            int indexOf2 = this.dimensionRatio.indexOf(58);
                            if (indexOf2 >= 0 && indexOf2 < length - 1) {
                                String substring2 = this.dimensionRatio.substring(i, indexOf2);
                                String substring3 = this.dimensionRatio.substring(indexOf2 + 1);
                                if (substring2.length() > 0 && substring3.length() > 0) {
                                    try {
                                        float parseFloat = Float.parseFloat(substring2);
                                        float parseFloat2 = Float.parseFloat(substring3);
                                        if (parseFloat > 0.0f && parseFloat2 > 0.0f) {
                                            if (this.dimensionRatioSide != 1) {
                                                this.dimensionRatioValue = Math.abs(parseFloat / parseFloat2);
                                                break;
                                            } else {
                                                this.dimensionRatioValue = Math.abs(parseFloat2 / parseFloat);
                                                break;
                                            }
                                        }
                                    } catch (NumberFormatException unused5) {
                                        break;
                                    }
                                }
                            } else {
                                String substring4 = this.dimensionRatio.substring(i);
                                if (substring4.length() <= 0) {
                                    break;
                                } else {
                                    this.dimensionRatioValue = Float.parseFloat(substring4);
                                    break;
                                }
                            }
                        }
                        break;
                    case 45:
                        this.horizontalWeight = obtainStyledAttributes.getFloat(index, this.horizontalWeight);
                        break;
                    case 46:
                        this.verticalWeight = obtainStyledAttributes.getFloat(index, this.verticalWeight);
                        break;
                    case 47:
                        this.horizontalChainStyle = obtainStyledAttributes.getInt(index, 0);
                        break;
                    case 48:
                        this.verticalChainStyle = obtainStyledAttributes.getInt(index, 0);
                        break;
                    case 49:
                        this.editorAbsoluteX = obtainStyledAttributes.getDimensionPixelOffset(index, this.editorAbsoluteX);
                        break;
                    case 50:
                        this.editorAbsoluteY = obtainStyledAttributes.getDimensionPixelOffset(index, this.editorAbsoluteY);
                        break;
                }
            }
            obtainStyledAttributes.recycle();
            validate();
        }

        public LayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
        }

        /* JADX WARNING: Removed duplicated region for block: B:14:0x0050  */
        /* JADX WARNING: Removed duplicated region for block: B:17:0x0059  */
        /* JADX WARNING: Removed duplicated region for block: B:20:0x0062  */
        /* JADX WARNING: Removed duplicated region for block: B:23:0x006a  */
        /* JADX WARNING: Removed duplicated region for block: B:26:0x0072  */
        /* JADX WARNING: Removed duplicated region for block: B:33:0x0088  */
        /* JADX WARNING: Removed duplicated region for block: B:34:0x0092  */
        @TargetApi(17)
        public void resolveLayoutDirection(int i) {
            int i2 = this.leftMargin;
            int i3 = this.rightMargin;
            super.resolveLayoutDirection(i);
            this.resolvedRightToLeft = -1;
            this.resolvedRightToRight = -1;
            this.resolvedLeftToLeft = -1;
            this.resolvedLeftToRight = -1;
            this.resolveGoneLeftMargin = -1;
            this.resolveGoneRightMargin = -1;
            this.resolveGoneLeftMargin = this.goneLeftMargin;
            this.resolveGoneRightMargin = this.goneRightMargin;
            this.resolvedHorizontalBias = this.horizontalBias;
            this.resolvedGuideBegin = this.guideBegin;
            this.resolvedGuideEnd = this.guideEnd;
            this.resolvedGuidePercent = this.guidePercent;
            boolean z = false;
            if (1 == getLayoutDirection()) {
                if (this.startToEnd != -1) {
                    this.resolvedRightToLeft = this.startToEnd;
                } else {
                    if (this.startToStart != -1) {
                        this.resolvedRightToRight = this.startToStart;
                    }
                    if (this.endToStart != -1) {
                        this.resolvedLeftToRight = this.endToStart;
                        z = true;
                    }
                    if (this.endToEnd != -1) {
                        this.resolvedLeftToLeft = this.endToEnd;
                        z = true;
                    }
                    if (this.goneStartMargin != -1) {
                        this.resolveGoneRightMargin = this.goneStartMargin;
                    }
                    if (this.goneEndMargin != -1) {
                        this.resolveGoneLeftMargin = this.goneEndMargin;
                    }
                    if (z) {
                        this.resolvedHorizontalBias = 1.0f - this.horizontalBias;
                    }
                    if (this.isGuideline && this.orientation == 1) {
                        if (this.guidePercent == -1.0f) {
                            this.resolvedGuidePercent = 1.0f - this.guidePercent;
                            this.resolvedGuideBegin = -1;
                            this.resolvedGuideEnd = -1;
                        } else if (this.guideBegin != -1) {
                            this.resolvedGuideEnd = this.guideBegin;
                            this.resolvedGuideBegin = -1;
                            this.resolvedGuidePercent = -1.0f;
                        } else if (this.guideEnd != -1) {
                            this.resolvedGuideBegin = this.guideEnd;
                            this.resolvedGuideEnd = -1;
                            this.resolvedGuidePercent = -1.0f;
                        }
                    }
                }
                z = true;
                if (this.endToStart != -1) {
                }
                if (this.endToEnd != -1) {
                }
                if (this.goneStartMargin != -1) {
                }
                if (this.goneEndMargin != -1) {
                }
                if (z) {
                }
                if (this.guidePercent == -1.0f) {
                }
            } else {
                if (this.startToEnd != -1) {
                    this.resolvedLeftToRight = this.startToEnd;
                }
                if (this.startToStart != -1) {
                    this.resolvedLeftToLeft = this.startToStart;
                }
                if (this.endToStart != -1) {
                    this.resolvedRightToLeft = this.endToStart;
                }
                if (this.endToEnd != -1) {
                    this.resolvedRightToRight = this.endToEnd;
                }
                if (this.goneStartMargin != -1) {
                    this.resolveGoneLeftMargin = this.goneStartMargin;
                }
                if (this.goneEndMargin != -1) {
                    this.resolveGoneRightMargin = this.goneEndMargin;
                }
            }
            if (this.endToStart == -1 && this.endToEnd == -1 && this.startToStart == -1 && this.startToEnd == -1) {
                if (this.rightToLeft != -1) {
                    this.resolvedRightToLeft = this.rightToLeft;
                    if (this.rightMargin <= 0 && i3 > 0) {
                        this.rightMargin = i3;
                    }
                } else if (this.rightToRight != -1) {
                    this.resolvedRightToRight = this.rightToRight;
                    if (this.rightMargin <= 0 && i3 > 0) {
                        this.rightMargin = i3;
                    }
                }
                if (this.leftToLeft != -1) {
                    this.resolvedLeftToLeft = this.leftToLeft;
                    if (this.leftMargin <= 0 && i2 > 0) {
                        this.leftMargin = i2;
                    }
                } else if (this.leftToRight != -1) {
                    this.resolvedLeftToRight = this.leftToRight;
                    if (this.leftMargin <= 0 && i2 > 0) {
                        this.leftMargin = i2;
                    }
                }
            }
        }

        public void validate() {
            this.isGuideline = false;
            this.horizontalDimensionFixed = true;
            this.verticalDimensionFixed = true;
            if (this.width == -2 && this.constrainedWidth) {
                this.horizontalDimensionFixed = false;
                this.matchConstraintDefaultWidth = 1;
            }
            if (this.height == -2 && this.constrainedHeight) {
                this.verticalDimensionFixed = false;
                this.matchConstraintDefaultHeight = 1;
            }
            if (this.width == 0 || this.width == -1) {
                this.horizontalDimensionFixed = false;
                if (this.width == 0 && this.matchConstraintDefaultWidth == 1) {
                    this.width = -2;
                    this.constrainedWidth = true;
                }
            }
            if (this.height == 0 || this.height == -1) {
                this.verticalDimensionFixed = false;
                if (this.height == 0 && this.matchConstraintDefaultHeight == 1) {
                    this.height = -2;
                    this.constrainedHeight = true;
                }
            }
            if (this.guidePercent != -1.0f || this.guideBegin != -1 || this.guideEnd != -1) {
                this.isGuideline = true;
                this.horizontalDimensionFixed = true;
                this.verticalDimensionFixed = true;
                if (!(this.widget instanceof Guideline)) {
                    this.widget = new Guideline();
                }
                ((Guideline) this.widget).setOrientation(this.orientation);
            }
        }
    }

    public ConstraintLayout(Context context) {
        super(context);
        init(null);
    }

    public ConstraintLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(attributeSet);
    }

    public ConstraintLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(attributeSet);
    }

    private final ConstraintWidget getTargetWidget(int i) {
        if (i == 0) {
            return this.mLayoutWidget;
        }
        View view = (View) this.mChildrenByIds.get(i);
        if (view == null) {
            view = findViewById(i);
            if (!(view == null || view == this || view.getParent() != this)) {
                onViewAdded(view);
            }
        }
        if (view == this) {
            return this.mLayoutWidget;
        }
        return view == null ? null : ((LayoutParams) view.getLayoutParams()).widget;
    }

    private void init(AttributeSet attributeSet) {
        this.mLayoutWidget.setCompanionWidget(this);
        this.mChildrenByIds.put(getId(), this);
        this.mConstraintSet = null;
        if (attributeSet != null) {
            TypedArray obtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, R.styleable.ConstraintLayout_Layout);
            int indexCount = obtainStyledAttributes.getIndexCount();
            for (int i = 0; i < indexCount; i++) {
                int index = obtainStyledAttributes.getIndex(i);
                if (index == R.styleable.ConstraintLayout_Layout_android_minWidth) {
                    this.mMinWidth = obtainStyledAttributes.getDimensionPixelOffset(index, this.mMinWidth);
                } else if (index == R.styleable.ConstraintLayout_Layout_android_minHeight) {
                    this.mMinHeight = obtainStyledAttributes.getDimensionPixelOffset(index, this.mMinHeight);
                } else if (index == R.styleable.ConstraintLayout_Layout_android_maxWidth) {
                    this.mMaxWidth = obtainStyledAttributes.getDimensionPixelOffset(index, this.mMaxWidth);
                } else if (index == R.styleable.ConstraintLayout_Layout_android_maxHeight) {
                    this.mMaxHeight = obtainStyledAttributes.getDimensionPixelOffset(index, this.mMaxHeight);
                } else if (index == R.styleable.ConstraintLayout_Layout_layout_optimizationLevel) {
                    this.mOptimizationLevel = obtainStyledAttributes.getInt(index, this.mOptimizationLevel);
                } else if (index == R.styleable.ConstraintLayout_Layout_constraintSet) {
                    int resourceId = obtainStyledAttributes.getResourceId(index, 0);
                    try {
                        this.mConstraintSet = new ConstraintSet();
                        this.mConstraintSet.load(getContext(), resourceId);
                    } catch (NotFoundException unused) {
                        this.mConstraintSet = null;
                    }
                    this.mConstraintSetId = resourceId;
                }
            }
            obtainStyledAttributes.recycle();
        }
        this.mLayoutWidget.setOptimizationLevel(this.mOptimizationLevel);
    }

    private void internalMeasureChildren(int i, int i2) {
        boolean z;
        boolean z2;
        int i3;
        int i4;
        int i5 = i;
        int i6 = i2;
        int paddingTop = getPaddingTop() + getPaddingBottom();
        int paddingLeft = getPaddingLeft() + getPaddingRight();
        int childCount = getChildCount();
        for (int i7 = 0; i7 < childCount; i7++) {
            View childAt = getChildAt(i7);
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                ConstraintWidget constraintWidget = layoutParams.widget;
                if (!layoutParams.isGuideline && !layoutParams.isHelper) {
                    constraintWidget.setVisibility(childAt.getVisibility());
                    int i8 = layoutParams.width;
                    int i9 = layoutParams.height;
                    if (layoutParams.horizontalDimensionFixed || layoutParams.verticalDimensionFixed || (!layoutParams.horizontalDimensionFixed && layoutParams.matchConstraintDefaultWidth == 1) || layoutParams.width == -1 || (!layoutParams.verticalDimensionFixed && (layoutParams.matchConstraintDefaultHeight == 1 || layoutParams.height == -1))) {
                        if (i8 == 0) {
                            i3 = getChildMeasureSpec(i5, paddingLeft, -2);
                            z2 = true;
                        } else if (i8 == -1) {
                            i3 = getChildMeasureSpec(i5, paddingLeft, -1);
                            z2 = false;
                        } else {
                            z2 = i8 == -2;
                            i3 = getChildMeasureSpec(i5, paddingLeft, i8);
                        }
                        if (i9 == 0) {
                            i4 = getChildMeasureSpec(i6, paddingTop, -2);
                            z = true;
                        } else if (i9 == -1) {
                            i4 = getChildMeasureSpec(i6, paddingTop, -1);
                            z = false;
                        } else {
                            z = i9 == -2;
                            i4 = getChildMeasureSpec(i6, paddingTop, i9);
                        }
                        childAt.measure(i3, i4);
                        if (this.mMetrics != null) {
                            this.mMetrics.measures++;
                        }
                        constraintWidget.setWidthWrapContent(i8 == -2);
                        constraintWidget.setHeightWrapContent(i9 == -2);
                        i8 = childAt.getMeasuredWidth();
                        i9 = childAt.getMeasuredHeight();
                    } else {
                        z2 = false;
                        z = false;
                    }
                    constraintWidget.setWidth(i8);
                    constraintWidget.setHeight(i9);
                    if (z2) {
                        constraintWidget.setWrapWidth(i8);
                    }
                    if (z) {
                        constraintWidget.setWrapHeight(i9);
                    }
                    if (layoutParams.needsBaseline) {
                        int baseline = childAt.getBaseline();
                        if (baseline != -1) {
                            constraintWidget.setBaselineDistance(baseline);
                        }
                    }
                }
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:110:0x021a  */
    /* JADX WARNING: Removed duplicated region for block: B:120:0x0258  */
    /* JADX WARNING: Removed duplicated region for block: B:130:0x0277  */
    /* JADX WARNING: Removed duplicated region for block: B:131:0x0282  */
    /* JADX WARNING: Removed duplicated region for block: B:134:0x0287  */
    /* JADX WARNING: Removed duplicated region for block: B:135:0x0289  */
    /* JADX WARNING: Removed duplicated region for block: B:138:0x028f  */
    /* JADX WARNING: Removed duplicated region for block: B:139:0x0291  */
    /* JADX WARNING: Removed duplicated region for block: B:142:0x02a5  */
    /* JADX WARNING: Removed duplicated region for block: B:144:0x02aa  */
    /* JADX WARNING: Removed duplicated region for block: B:146:0x02af  */
    /* JADX WARNING: Removed duplicated region for block: B:147:0x02b7  */
    /* JADX WARNING: Removed duplicated region for block: B:149:0x02c0  */
    /* JADX WARNING: Removed duplicated region for block: B:151:0x02ca  */
    /* JADX WARNING: Removed duplicated region for block: B:154:0x02d6  */
    /* JADX WARNING: Removed duplicated region for block: B:157:0x02e1  */
    private void internalMeasureDimensions(int i, int i2) {
        long j;
        int i3;
        int i4;
        int i5;
        long j2;
        int i6;
        int i7;
        boolean z;
        int i8;
        boolean z2;
        int i9;
        int i10 = i;
        int i11 = i2;
        int paddingTop = getPaddingTop() + getPaddingBottom();
        int paddingLeft = getPaddingLeft() + getPaddingRight();
        int childCount = getChildCount();
        int i12 = 0;
        while (true) {
            j = 1;
            i3 = 8;
            if (i12 >= childCount) {
                break;
            }
            View childAt = getChildAt(i12);
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                ConstraintWidget constraintWidget = layoutParams.widget;
                if (!layoutParams.isGuideline && !layoutParams.isHelper) {
                    constraintWidget.setVisibility(childAt.getVisibility());
                    int i13 = layoutParams.width;
                    int i14 = layoutParams.height;
                    if (i13 == 0 || i14 == 0) {
                        i9 = paddingTop;
                        constraintWidget.getResolutionWidth().invalidate();
                        constraintWidget.getResolutionHeight().invalidate();
                        i12++;
                        paddingTop = i9;
                        i11 = i2;
                    } else {
                        boolean z3 = i13 == -2;
                        int childMeasureSpec = getChildMeasureSpec(i10, paddingLeft, i13);
                        boolean z4 = i14 == -2;
                        childAt.measure(childMeasureSpec, getChildMeasureSpec(i11, paddingTop, i14));
                        if (this.mMetrics != null) {
                            Metrics metrics = this.mMetrics;
                            i9 = paddingTop;
                            metrics.measures++;
                        } else {
                            i9 = paddingTop;
                        }
                        constraintWidget.setWidthWrapContent(i13 == -2);
                        constraintWidget.setHeightWrapContent(i14 == -2);
                        int measuredWidth = childAt.getMeasuredWidth();
                        int measuredHeight = childAt.getMeasuredHeight();
                        constraintWidget.setWidth(measuredWidth);
                        constraintWidget.setHeight(measuredHeight);
                        if (z3) {
                            constraintWidget.setWrapWidth(measuredWidth);
                        }
                        if (z4) {
                            constraintWidget.setWrapHeight(measuredHeight);
                        }
                        if (layoutParams.needsBaseline) {
                            int baseline = childAt.getBaseline();
                            if (baseline != -1) {
                                constraintWidget.setBaselineDistance(baseline);
                            }
                        }
                        if (layoutParams.horizontalDimensionFixed && layoutParams.verticalDimensionFixed) {
                            constraintWidget.getResolutionWidth().resolve(measuredWidth);
                            constraintWidget.getResolutionHeight().resolve(measuredHeight);
                        }
                        i12++;
                        paddingTop = i9;
                        i11 = i2;
                    }
                }
            }
            i9 = paddingTop;
            i12++;
            paddingTop = i9;
            i11 = i2;
        }
        int i15 = paddingTop;
        this.mLayoutWidget.solveGraph();
        int i16 = 0;
        while (i16 < childCount) {
            View childAt2 = getChildAt(i16);
            if (childAt2.getVisibility() != i3) {
                LayoutParams layoutParams2 = (LayoutParams) childAt2.getLayoutParams();
                ConstraintWidget constraintWidget2 = layoutParams2.widget;
                if (!layoutParams2.isGuideline && !layoutParams2.isHelper) {
                    constraintWidget2.setVisibility(childAt2.getVisibility());
                    int i17 = layoutParams2.width;
                    int i18 = layoutParams2.height;
                    if (i17 == 0 || i18 == 0) {
                        ResolutionAnchor resolutionNode = constraintWidget2.getAnchor(Type.LEFT).getResolutionNode();
                        ResolutionAnchor resolutionNode2 = constraintWidget2.getAnchor(Type.RIGHT).getResolutionNode();
                        boolean z5 = (constraintWidget2.getAnchor(Type.LEFT).getTarget() == null || constraintWidget2.getAnchor(Type.RIGHT).getTarget() == null) ? false : true;
                        ResolutionAnchor resolutionNode3 = constraintWidget2.getAnchor(Type.TOP).getResolutionNode();
                        ResolutionAnchor resolutionNode4 = constraintWidget2.getAnchor(Type.BOTTOM).getResolutionNode();
                        boolean z6 = (constraintWidget2.getAnchor(Type.TOP).getTarget() == null || constraintWidget2.getAnchor(Type.BOTTOM).getTarget() == null) ? false : true;
                        if (i17 != 0 || i18 != 0 || !z5 || !z6) {
                            i5 = childCount;
                            i4 = i16;
                            boolean z7 = this.mLayoutWidget.getHorizontalDimensionBehaviour() != DimensionBehaviour.WRAP_CONTENT;
                            LayoutParams layoutParams3 = layoutParams2;
                            boolean z8 = this.mLayoutWidget.getVerticalDimensionBehaviour() != DimensionBehaviour.WRAP_CONTENT;
                            if (!z7) {
                                constraintWidget2.getResolutionWidth().invalidate();
                            }
                            if (!z8) {
                                constraintWidget2.getResolutionHeight().invalidate();
                            }
                            if (i17 == 0) {
                                if (!z7 || !constraintWidget2.isSpreadWidth() || !z5 || !resolutionNode.isResolved() || !resolutionNode2.isResolved()) {
                                    i7 = getChildMeasureSpec(i10, paddingLeft, -2);
                                    z7 = false;
                                    z = true;
                                    if (i18 != 0) {
                                        i6 = i15;
                                        int i19 = i2;
                                        if (i18 == -1) {
                                            i8 = getChildMeasureSpec(i19, i6, -1);
                                        } else {
                                            z2 = i18 == -2;
                                            i8 = getChildMeasureSpec(i19, i6, i18);
                                            childAt2.measure(i7, i8);
                                            if (this.mMetrics != null) {
                                            }
                                            constraintWidget2.setWidthWrapContent(i17 == -2);
                                            constraintWidget2.setHeightWrapContent(i18 == -2);
                                            int measuredWidth2 = childAt2.getMeasuredWidth();
                                            int measuredHeight2 = childAt2.getMeasuredHeight();
                                            constraintWidget2.setWidth(measuredWidth2);
                                            constraintWidget2.setHeight(measuredHeight2);
                                            if (z) {
                                            }
                                            if (z2) {
                                            }
                                            if (z7) {
                                            }
                                            if (z8) {
                                            }
                                            if (layoutParams3.needsBaseline) {
                                            }
                                            i16 = i4 + 1;
                                            i15 = i6;
                                            j = j2;
                                            childCount = i5;
                                            i3 = 8;
                                        }
                                    } else if (!z8 || !constraintWidget2.isSpreadHeight() || !z6 || !resolutionNode3.isResolved() || !resolutionNode4.isResolved()) {
                                        i6 = i15;
                                        i8 = getChildMeasureSpec(i2, i6, -2);
                                        z8 = false;
                                        z2 = true;
                                        childAt2.measure(i7, i8);
                                        if (this.mMetrics != null) {
                                            Metrics metrics2 = this.mMetrics;
                                            j2 = 1;
                                            metrics2.measures++;
                                        } else {
                                            j2 = 1;
                                        }
                                        constraintWidget2.setWidthWrapContent(i17 == -2);
                                        constraintWidget2.setHeightWrapContent(i18 == -2);
                                        int measuredWidth22 = childAt2.getMeasuredWidth();
                                        int measuredHeight22 = childAt2.getMeasuredHeight();
                                        constraintWidget2.setWidth(measuredWidth22);
                                        constraintWidget2.setHeight(measuredHeight22);
                                        if (z) {
                                            constraintWidget2.setWrapWidth(measuredWidth22);
                                        }
                                        if (z2) {
                                            constraintWidget2.setWrapHeight(measuredHeight22);
                                        }
                                        if (z7) {
                                            constraintWidget2.getResolutionWidth().resolve(measuredWidth22);
                                        } else {
                                            constraintWidget2.getResolutionWidth().remove();
                                        }
                                        if (z8) {
                                            constraintWidget2.getResolutionHeight().resolve(measuredHeight22);
                                        } else {
                                            constraintWidget2.getResolutionHeight().remove();
                                        }
                                        if (layoutParams3.needsBaseline) {
                                            int baseline2 = childAt2.getBaseline();
                                            if (baseline2 != -1) {
                                                constraintWidget2.setBaselineDistance(baseline2);
                                            }
                                        }
                                        i16 = i4 + 1;
                                        i15 = i6;
                                        j = j2;
                                        childCount = i5;
                                        i3 = 8;
                                    } else {
                                        i18 = (int) (resolutionNode4.getResolvedValue() - resolutionNode3.getResolvedValue());
                                        constraintWidget2.getResolutionHeight().resolve(i18);
                                        i6 = i15;
                                        i8 = getChildMeasureSpec(i2, i6, i18);
                                    }
                                    z2 = false;
                                    childAt2.measure(i7, i8);
                                    if (this.mMetrics != null) {
                                    }
                                    constraintWidget2.setWidthWrapContent(i17 == -2);
                                    constraintWidget2.setHeightWrapContent(i18 == -2);
                                    int measuredWidth222 = childAt2.getMeasuredWidth();
                                    int measuredHeight222 = childAt2.getMeasuredHeight();
                                    constraintWidget2.setWidth(measuredWidth222);
                                    constraintWidget2.setHeight(measuredHeight222);
                                    if (z) {
                                    }
                                    if (z2) {
                                    }
                                    if (z7) {
                                    }
                                    if (z8) {
                                    }
                                    if (layoutParams3.needsBaseline) {
                                    }
                                    i16 = i4 + 1;
                                    i15 = i6;
                                    j = j2;
                                    childCount = i5;
                                    i3 = 8;
                                } else {
                                    i17 = (int) (resolutionNode2.getResolvedValue() - resolutionNode.getResolvedValue());
                                    constraintWidget2.getResolutionWidth().resolve(i17);
                                    i7 = getChildMeasureSpec(i10, paddingLeft, i17);
                                }
                            } else if (i17 == -1) {
                                i7 = getChildMeasureSpec(i10, paddingLeft, -1);
                            } else {
                                z = i17 == -2;
                                i7 = getChildMeasureSpec(i10, paddingLeft, i17);
                                if (i18 != 0) {
                                }
                                z2 = false;
                                childAt2.measure(i7, i8);
                                if (this.mMetrics != null) {
                                }
                                constraintWidget2.setWidthWrapContent(i17 == -2);
                                constraintWidget2.setHeightWrapContent(i18 == -2);
                                int measuredWidth2222 = childAt2.getMeasuredWidth();
                                int measuredHeight2222 = childAt2.getMeasuredHeight();
                                constraintWidget2.setWidth(measuredWidth2222);
                                constraintWidget2.setHeight(measuredHeight2222);
                                if (z) {
                                }
                                if (z2) {
                                }
                                if (z7) {
                                }
                                if (z8) {
                                }
                                if (layoutParams3.needsBaseline) {
                                }
                                i16 = i4 + 1;
                                i15 = i6;
                                j = j2;
                                childCount = i5;
                                i3 = 8;
                            }
                            z = false;
                            if (i18 != 0) {
                            }
                            z2 = false;
                            childAt2.measure(i7, i8);
                            if (this.mMetrics != null) {
                            }
                            constraintWidget2.setWidthWrapContent(i17 == -2);
                            constraintWidget2.setHeightWrapContent(i18 == -2);
                            int measuredWidth22222 = childAt2.getMeasuredWidth();
                            int measuredHeight22222 = childAt2.getMeasuredHeight();
                            constraintWidget2.setWidth(measuredWidth22222);
                            constraintWidget2.setHeight(measuredHeight22222);
                            if (z) {
                            }
                            if (z2) {
                            }
                            if (z7) {
                            }
                            if (z8) {
                            }
                            if (layoutParams3.needsBaseline) {
                            }
                            i16 = i4 + 1;
                            i15 = i6;
                            j = j2;
                            childCount = i5;
                            i3 = 8;
                        } else {
                            i4 = i16;
                            i5 = childCount;
                            i6 = i15;
                            int i20 = i2;
                            j2 = 1;
                            i16 = i4 + 1;
                            i15 = i6;
                            j = j2;
                            childCount = i5;
                            i3 = 8;
                        }
                    }
                }
            }
            i4 = i16;
            i5 = childCount;
            j2 = j;
            i6 = i15;
            int i21 = i2;
            i16 = i4 + 1;
            i15 = i6;
            j = j2;
            childCount = i5;
            i3 = 8;
        }
    }

    private void setChildrenConstraints() {
        int i;
        int i2;
        int i3;
        float f;
        int i4;
        int i5;
        boolean isInEditMode = isInEditMode();
        int childCount = getChildCount();
        boolean z = false;
        if (isInEditMode) {
            for (int i6 = 0; i6 < childCount; i6++) {
                View childAt = getChildAt(i6);
                try {
                    String resourceName = getResources().getResourceName(childAt.getId());
                    setDesignInformation(0, resourceName, Integer.valueOf(childAt.getId()));
                    int indexOf = resourceName.indexOf(47);
                    if (indexOf != -1) {
                        resourceName = resourceName.substring(indexOf + 1);
                    }
                    getTargetWidget(childAt.getId()).setDebugName(resourceName);
                } catch (NotFoundException unused) {
                }
            }
        }
        for (int i7 = 0; i7 < childCount; i7++) {
            ConstraintWidget viewWidget = getViewWidget(getChildAt(i7));
            if (viewWidget != null) {
                viewWidget.reset();
            }
        }
        if (this.mConstraintSetId != -1) {
            for (int i8 = 0; i8 < childCount; i8++) {
                View childAt2 = getChildAt(i8);
                if (childAt2.getId() == this.mConstraintSetId && (childAt2 instanceof Constraints)) {
                    this.mConstraintSet = ((Constraints) childAt2).getConstraintSet();
                }
            }
        }
        if (this.mConstraintSet != null) {
            this.mConstraintSet.applyToInternal(this);
        }
        this.mLayoutWidget.removeAllChildren();
        int size = this.mConstraintHelpers.size();
        if (size > 0) {
            for (int i9 = 0; i9 < size; i9++) {
                ((ConstraintHelper) this.mConstraintHelpers.get(i9)).updatePreLayout(this);
            }
        }
        for (int i10 = 0; i10 < childCount; i10++) {
            View childAt3 = getChildAt(i10);
            if (childAt3 instanceof Placeholder) {
                ((Placeholder) childAt3).updatePreLayout(this);
            }
        }
        for (int i11 = 0; i11 < childCount; i11++) {
            View childAt4 = getChildAt(i11);
            ConstraintWidget viewWidget2 = getViewWidget(childAt4);
            if (viewWidget2 != null) {
                LayoutParams layoutParams = (LayoutParams) childAt4.getLayoutParams();
                layoutParams.validate();
                if (layoutParams.helped) {
                    layoutParams.helped = z;
                } else if (isInEditMode) {
                    try {
                        String resourceName2 = getResources().getResourceName(childAt4.getId());
                        setDesignInformation(z ? 1 : 0, resourceName2, Integer.valueOf(childAt4.getId()));
                        getTargetWidget(childAt4.getId()).setDebugName(resourceName2.substring(resourceName2.indexOf("id/") + 3));
                    } catch (NotFoundException unused2) {
                    }
                }
                viewWidget2.setVisibility(childAt4.getVisibility());
                if (layoutParams.isInPlaceholder) {
                    viewWidget2.setVisibility(8);
                }
                viewWidget2.setCompanionWidget(childAt4);
                this.mLayoutWidget.add(viewWidget2);
                if (!layoutParams.verticalDimensionFixed || !layoutParams.horizontalDimensionFixed) {
                    this.mVariableDimensionsWidgets.add(viewWidget2);
                }
                if (layoutParams.isGuideline) {
                    Guideline guideline = (Guideline) viewWidget2;
                    int i12 = layoutParams.resolvedGuideBegin;
                    int i13 = layoutParams.resolvedGuideEnd;
                    float f2 = layoutParams.resolvedGuidePercent;
                    if (VERSION.SDK_INT < 17) {
                        i12 = layoutParams.guideBegin;
                        i13 = layoutParams.guideEnd;
                        f2 = layoutParams.guidePercent;
                    }
                    if (f2 != -1.0f) {
                        guideline.setGuidePercent(f2);
                    } else if (i12 != -1) {
                        guideline.setGuideBegin(i12);
                    } else if (i13 != -1) {
                        guideline.setGuideEnd(i13);
                    }
                } else if (layoutParams.leftToLeft != -1 || layoutParams.leftToRight != -1 || layoutParams.rightToLeft != -1 || layoutParams.rightToRight != -1 || layoutParams.startToStart != -1 || layoutParams.startToEnd != -1 || layoutParams.endToStart != -1 || layoutParams.endToEnd != -1 || layoutParams.topToTop != -1 || layoutParams.topToBottom != -1 || layoutParams.bottomToTop != -1 || layoutParams.bottomToBottom != -1 || layoutParams.baselineToBaseline != -1 || layoutParams.editorAbsoluteX != -1 || layoutParams.editorAbsoluteY != -1 || layoutParams.circleConstraint != -1 || layoutParams.width == -1 || layoutParams.height == -1) {
                    int i14 = layoutParams.resolvedLeftToLeft;
                    int i15 = layoutParams.resolvedLeftToRight;
                    int i16 = layoutParams.resolvedRightToLeft;
                    int i17 = layoutParams.resolvedRightToRight;
                    int i18 = layoutParams.resolveGoneLeftMargin;
                    int i19 = layoutParams.resolveGoneRightMargin;
                    float f3 = layoutParams.resolvedHorizontalBias;
                    if (VERSION.SDK_INT < 17) {
                        int i20 = layoutParams.leftToLeft;
                        int i21 = layoutParams.leftToRight;
                        i16 = layoutParams.rightToLeft;
                        i17 = layoutParams.rightToRight;
                        int i22 = layoutParams.goneLeftMargin;
                        int i23 = layoutParams.goneRightMargin;
                        f3 = layoutParams.horizontalBias;
                        if (i20 == -1 && i21 == -1) {
                            if (layoutParams.startToStart != -1) {
                                i20 = layoutParams.startToStart;
                            } else if (layoutParams.startToEnd != -1) {
                                i21 = layoutParams.startToEnd;
                            }
                        }
                        int i24 = i21;
                        i14 = i20;
                        i3 = i24;
                        if (i16 == -1 && i17 == -1) {
                            if (layoutParams.endToStart != -1) {
                                i16 = layoutParams.endToStart;
                            } else if (layoutParams.endToEnd != -1) {
                                i17 = layoutParams.endToEnd;
                            }
                        }
                        i2 = i22;
                        i = i23;
                    } else {
                        i3 = i15;
                        i = i19;
                        i2 = i18;
                    }
                    int i25 = i17;
                    float f4 = f3;
                    int i26 = i16;
                    if (layoutParams.circleConstraint != -1) {
                        ConstraintWidget targetWidget = getTargetWidget(layoutParams.circleConstraint);
                        if (targetWidget != null) {
                            viewWidget2.connectCircularConstraint(targetWidget, layoutParams.circleAngle, layoutParams.circleRadius);
                        }
                    } else {
                        if (i14 != -1) {
                            ConstraintWidget targetWidget2 = getTargetWidget(i14);
                            if (targetWidget2 != null) {
                                Type type = Type.LEFT;
                                f = f4;
                                Type type2 = Type.LEFT;
                                i5 = i25;
                                viewWidget2.immediateConnect(type, targetWidget2, type2, layoutParams.leftMargin, i2);
                            } else {
                                f = f4;
                                i5 = i25;
                            }
                            i4 = i5;
                        } else {
                            f = f4;
                            i4 = i25;
                            if (i3 != -1) {
                                ConstraintWidget targetWidget3 = getTargetWidget(i3);
                                if (targetWidget3 != null) {
                                    viewWidget2.immediateConnect(Type.LEFT, targetWidget3, Type.RIGHT, layoutParams.leftMargin, i2);
                                }
                            }
                        }
                        if (i26 != -1) {
                            ConstraintWidget targetWidget4 = getTargetWidget(i26);
                            if (targetWidget4 != null) {
                                viewWidget2.immediateConnect(Type.RIGHT, targetWidget4, Type.LEFT, layoutParams.rightMargin, i);
                            }
                        } else if (i4 != -1) {
                            ConstraintWidget targetWidget5 = getTargetWidget(i4);
                            if (targetWidget5 != null) {
                                viewWidget2.immediateConnect(Type.RIGHT, targetWidget5, Type.RIGHT, layoutParams.rightMargin, i);
                            }
                        }
                        if (layoutParams.topToTop != -1) {
                            ConstraintWidget targetWidget6 = getTargetWidget(layoutParams.topToTop);
                            if (targetWidget6 != null) {
                                viewWidget2.immediateConnect(Type.TOP, targetWidget6, Type.TOP, layoutParams.topMargin, layoutParams.goneTopMargin);
                            }
                        } else if (layoutParams.topToBottom != -1) {
                            ConstraintWidget targetWidget7 = getTargetWidget(layoutParams.topToBottom);
                            if (targetWidget7 != null) {
                                viewWidget2.immediateConnect(Type.TOP, targetWidget7, Type.BOTTOM, layoutParams.topMargin, layoutParams.goneTopMargin);
                            }
                        }
                        if (layoutParams.bottomToTop != -1) {
                            ConstraintWidget targetWidget8 = getTargetWidget(layoutParams.bottomToTop);
                            if (targetWidget8 != null) {
                                viewWidget2.immediateConnect(Type.BOTTOM, targetWidget8, Type.TOP, layoutParams.bottomMargin, layoutParams.goneBottomMargin);
                            }
                        } else if (layoutParams.bottomToBottom != -1) {
                            ConstraintWidget targetWidget9 = getTargetWidget(layoutParams.bottomToBottom);
                            if (targetWidget9 != null) {
                                viewWidget2.immediateConnect(Type.BOTTOM, targetWidget9, Type.BOTTOM, layoutParams.bottomMargin, layoutParams.goneBottomMargin);
                            }
                        }
                        if (layoutParams.baselineToBaseline != -1) {
                            View view = (View) this.mChildrenByIds.get(layoutParams.baselineToBaseline);
                            ConstraintWidget targetWidget10 = getTargetWidget(layoutParams.baselineToBaseline);
                            if (!(targetWidget10 == null || view == null || !(view.getLayoutParams() instanceof LayoutParams))) {
                                LayoutParams layoutParams2 = (LayoutParams) view.getLayoutParams();
                                layoutParams.needsBaseline = true;
                                layoutParams2.needsBaseline = true;
                                viewWidget2.getAnchor(Type.BASELINE).connect(targetWidget10.getAnchor(Type.BASELINE), 0, -1, Strength.STRONG, 0, true);
                                viewWidget2.getAnchor(Type.TOP).reset();
                                viewWidget2.getAnchor(Type.BOTTOM).reset();
                            }
                        }
                        float f5 = f;
                        if (f5 >= 0.0f && f5 != 0.5f) {
                            viewWidget2.setHorizontalBiasPercent(f5);
                        }
                        if (layoutParams.verticalBias >= 0.0f && layoutParams.verticalBias != 0.5f) {
                            viewWidget2.setVerticalBiasPercent(layoutParams.verticalBias);
                        }
                    }
                    if (isInEditMode && !(layoutParams.editorAbsoluteX == -1 && layoutParams.editorAbsoluteY == -1)) {
                        viewWidget2.setOrigin(layoutParams.editorAbsoluteX, layoutParams.editorAbsoluteY);
                    }
                    if (layoutParams.horizontalDimensionFixed) {
                        viewWidget2.setHorizontalDimensionBehaviour(DimensionBehaviour.FIXED);
                        viewWidget2.setWidth(layoutParams.width);
                    } else if (layoutParams.width == -1) {
                        viewWidget2.setHorizontalDimensionBehaviour(DimensionBehaviour.MATCH_PARENT);
                        viewWidget2.getAnchor(Type.LEFT).mMargin = layoutParams.leftMargin;
                        viewWidget2.getAnchor(Type.RIGHT).mMargin = layoutParams.rightMargin;
                    } else {
                        viewWidget2.setHorizontalDimensionBehaviour(DimensionBehaviour.MATCH_CONSTRAINT);
                        viewWidget2.setWidth(0);
                    }
                    if (layoutParams.verticalDimensionFixed) {
                        z = false;
                        viewWidget2.setVerticalDimensionBehaviour(DimensionBehaviour.FIXED);
                        viewWidget2.setHeight(layoutParams.height);
                    } else if (layoutParams.height == -1) {
                        viewWidget2.setVerticalDimensionBehaviour(DimensionBehaviour.MATCH_PARENT);
                        viewWidget2.getAnchor(Type.TOP).mMargin = layoutParams.topMargin;
                        viewWidget2.getAnchor(Type.BOTTOM).mMargin = layoutParams.bottomMargin;
                        z = false;
                    } else {
                        viewWidget2.setVerticalDimensionBehaviour(DimensionBehaviour.MATCH_CONSTRAINT);
                        z = false;
                        viewWidget2.setHeight(0);
                    }
                    if (layoutParams.dimensionRatio != null) {
                        viewWidget2.setDimensionRatio(layoutParams.dimensionRatio);
                    }
                    viewWidget2.setHorizontalWeight(layoutParams.horizontalWeight);
                    viewWidget2.setVerticalWeight(layoutParams.verticalWeight);
                    viewWidget2.setHorizontalChainStyle(layoutParams.horizontalChainStyle);
                    viewWidget2.setVerticalChainStyle(layoutParams.verticalChainStyle);
                    viewWidget2.setHorizontalMatchStyle(layoutParams.matchConstraintDefaultWidth, layoutParams.matchConstraintMinWidth, layoutParams.matchConstraintMaxWidth, layoutParams.matchConstraintPercentWidth);
                    viewWidget2.setVerticalMatchStyle(layoutParams.matchConstraintDefaultHeight, layoutParams.matchConstraintMinHeight, layoutParams.matchConstraintMaxHeight, layoutParams.matchConstraintPercentHeight);
                }
            }
        }
    }

    private void setSelfDimensionBehaviour(int i, int i2) {
        int mode = MeasureSpec.getMode(i);
        int size = MeasureSpec.getSize(i);
        int mode2 = MeasureSpec.getMode(i2);
        int size2 = MeasureSpec.getSize(i2);
        int paddingTop = getPaddingTop() + getPaddingBottom();
        int paddingLeft = getPaddingLeft() + getPaddingRight();
        DimensionBehaviour dimensionBehaviour = DimensionBehaviour.FIXED;
        DimensionBehaviour dimensionBehaviour2 = DimensionBehaviour.FIXED;
        getLayoutParams();
        if (mode != Integer.MIN_VALUE) {
            if (mode == 0) {
                dimensionBehaviour = DimensionBehaviour.WRAP_CONTENT;
            } else if (mode == 1073741824) {
                size = Math.min(this.mMaxWidth, size) - paddingLeft;
            }
            size = 0;
        } else {
            dimensionBehaviour = DimensionBehaviour.WRAP_CONTENT;
        }
        if (mode2 != Integer.MIN_VALUE) {
            if (mode2 == 0) {
                dimensionBehaviour2 = DimensionBehaviour.WRAP_CONTENT;
            } else if (mode2 == 1073741824) {
                size2 = Math.min(this.mMaxHeight, size2) - paddingTop;
            }
            size2 = 0;
        } else {
            dimensionBehaviour2 = DimensionBehaviour.WRAP_CONTENT;
        }
        this.mLayoutWidget.setMinWidth(0);
        this.mLayoutWidget.setMinHeight(0);
        this.mLayoutWidget.setHorizontalDimensionBehaviour(dimensionBehaviour);
        this.mLayoutWidget.setWidth(size);
        this.mLayoutWidget.setVerticalDimensionBehaviour(dimensionBehaviour2);
        this.mLayoutWidget.setHeight(size2);
        this.mLayoutWidget.setMinWidth((this.mMinWidth - getPaddingLeft()) - getPaddingRight());
        this.mLayoutWidget.setMinHeight((this.mMinHeight - getPaddingTop()) - getPaddingBottom());
    }

    private void updateHierarchy() {
        int childCount = getChildCount();
        boolean z = false;
        int i = 0;
        while (true) {
            if (i >= childCount) {
                break;
            } else if (getChildAt(i).isLayoutRequested()) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        if (z) {
            this.mVariableDimensionsWidgets.clear();
            setChildrenConstraints();
        }
    }

    private void updatePostMeasures() {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (childAt instanceof Placeholder) {
                ((Placeholder) childAt).updatePostMeasure(this);
            }
        }
        int size = this.mConstraintHelpers.size();
        if (size > 0) {
            for (int i2 = 0; i2 < size; i2++) {
                ((ConstraintHelper) this.mConstraintHelpers.get(i2)).updatePostMeasure(this);
            }
        }
    }

    public void addView(View view, int i, android.view.ViewGroup.LayoutParams layoutParams) {
        super.addView(view, i, layoutParams);
        if (VERSION.SDK_INT < 14) {
            onViewAdded(view);
        }
    }

    /* access modifiers changed from: protected */
    public boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof LayoutParams;
    }

    public void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (isInEditMode()) {
            int childCount = getChildCount();
            float width = (float) getWidth();
            float height = (float) getHeight();
            for (int i = 0; i < childCount; i++) {
                View childAt = getChildAt(i);
                if (childAt.getVisibility() != 8) {
                    Object tag = childAt.getTag();
                    if (tag != null && (tag instanceof String)) {
                        String[] split = ((String) tag).split(",");
                        if (split.length == 4) {
                            int parseInt = Integer.parseInt(split[0]);
                            int parseInt2 = Integer.parseInt(split[1]);
                            int i2 = (int) ((((float) parseInt) / 1080.0f) * width);
                            int i3 = (int) ((((float) parseInt2) / 1920.0f) * height);
                            int parseInt3 = (int) ((((float) Integer.parseInt(split[2])) / 1080.0f) * width);
                            int parseInt4 = (int) ((((float) Integer.parseInt(split[3])) / 1920.0f) * height);
                            Paint paint = new Paint();
                            paint.setColor(-65536);
                            float f = (float) i2;
                            float f2 = (float) (i2 + parseInt3);
                            Canvas canvas2 = canvas;
                            float f3 = (float) i3;
                            float f4 = f;
                            float f5 = f;
                            float f6 = f3;
                            Paint paint2 = paint;
                            float f7 = f2;
                            Paint paint3 = paint2;
                            canvas2.drawLine(f4, f6, f7, f3, paint3);
                            float f8 = (float) (i3 + parseInt4);
                            float f9 = f2;
                            float f10 = f8;
                            canvas2.drawLine(f9, f6, f7, f10, paint3);
                            float f11 = f8;
                            float f12 = f5;
                            canvas2.drawLine(f9, f11, f12, f10, paint3);
                            float f13 = f5;
                            canvas2.drawLine(f13, f11, f12, f3, paint3);
                            Paint paint4 = paint2;
                            paint4.setColor(-16711936);
                            Paint paint5 = paint4;
                            float f14 = f2;
                            Paint paint6 = paint5;
                            canvas2.drawLine(f13, f3, f14, f8, paint6);
                            canvas2.drawLine(f13, f8, f14, f3, paint6);
                        }
                    }
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(-2, -2);
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    /* access modifiers changed from: protected */
    public android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
        return new LayoutParams(layoutParams);
    }

    public Object getDesignInformation(int i, Object obj) {
        if (i == 0 && (obj instanceof String)) {
            String str = (String) obj;
            if (this.mDesignIds != null && this.mDesignIds.containsKey(str)) {
                return this.mDesignIds.get(str);
            }
        }
        return null;
    }

    public int getMaxHeight() {
        return this.mMaxHeight;
    }

    public int getMaxWidth() {
        return this.mMaxWidth;
    }

    public int getMinHeight() {
        return this.mMinHeight;
    }

    public int getMinWidth() {
        return this.mMinWidth;
    }

    public int getOptimizationLevel() {
        return this.mLayoutWidget.getOptimizationLevel();
    }

    public View getViewById(int i) {
        return (View) this.mChildrenByIds.get(i);
    }

    public final ConstraintWidget getViewWidget(View view) {
        if (view == this) {
            return this.mLayoutWidget;
        }
        return view == null ? null : ((LayoutParams) view.getLayoutParams()).widget;
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int childCount = getChildCount();
        boolean isInEditMode = isInEditMode();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
            ConstraintWidget constraintWidget = layoutParams.widget;
            if ((childAt.getVisibility() != 8 || layoutParams.isGuideline || layoutParams.isHelper || isInEditMode) && !layoutParams.isInPlaceholder) {
                int drawX = constraintWidget.getDrawX();
                int drawY = constraintWidget.getDrawY();
                int width = constraintWidget.getWidth() + drawX;
                int height = constraintWidget.getHeight() + drawY;
                childAt.layout(drawX, drawY, width, height);
                if (childAt instanceof Placeholder) {
                    View content = ((Placeholder) childAt).getContent();
                    if (content != null) {
                        content.setVisibility(0);
                        content.layout(drawX, drawY, width, height);
                    }
                }
            }
        }
        int size = this.mConstraintHelpers.size();
        if (size > 0) {
            for (int i6 = 0; i6 < size; i6++) {
                ((ConstraintHelper) this.mConstraintHelpers.get(i6)).updatePostLayout(this);
            }
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:171:0x037b  */
    /* JADX WARNING: Removed duplicated region for block: B:174:0x0390  */
    /* JADX WARNING: Removed duplicated region for block: B:181:0x03c9  */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x013e  */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x0155  */
    public void onMeasure(int i, int i2) {
        boolean z;
        int size;
        int i3;
        boolean z2;
        boolean z3;
        boolean z4;
        int i4;
        int i5;
        int i6 = i;
        int i7 = i2;
        System.currentTimeMillis();
        int mode = MeasureSpec.getMode(i);
        int size2 = MeasureSpec.getSize(i);
        int mode2 = MeasureSpec.getMode(i2);
        int size3 = MeasureSpec.getSize(i2);
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        this.mLayoutWidget.setX(paddingLeft);
        this.mLayoutWidget.setY(paddingTop);
        this.mLayoutWidget.setMaxWidth(this.mMaxWidth);
        this.mLayoutWidget.setMaxHeight(this.mMaxHeight);
        if (VERSION.SDK_INT >= 17) {
            this.mLayoutWidget.setRtl(getLayoutDirection() == 1);
        }
        setSelfDimensionBehaviour(i, i2);
        int width = this.mLayoutWidget.getWidth();
        int height = this.mLayoutWidget.getHeight();
        if (this.mDirtyHierarchy) {
            this.mDirtyHierarchy = false;
            updateHierarchy();
            z = true;
        } else {
            z = false;
        }
        boolean z5 = (this.mOptimizationLevel & 8) == 8;
        if (z5) {
            this.mLayoutWidget.preOptimize();
            this.mLayoutWidget.optimizeForDimensions(width, height);
            internalMeasureDimensions(i, i2);
        } else {
            internalMeasureChildren(i, i2);
        }
        updatePostMeasures();
        if (getChildCount() > 0 && z) {
            Analyzer.determineGroups(this.mLayoutWidget);
        }
        if (this.mLayoutWidget.mGroupsWrapOptimized) {
            if (this.mLayoutWidget.mHorizontalWrapOptimized && mode == Integer.MIN_VALUE) {
                if (this.mLayoutWidget.mWrapFixedWidth < size2) {
                    this.mLayoutWidget.setWidth(this.mLayoutWidget.mWrapFixedWidth);
                }
                this.mLayoutWidget.setHorizontalDimensionBehaviour(DimensionBehaviour.FIXED);
            }
            if (this.mLayoutWidget.mVerticalWrapOptimized && mode2 == Integer.MIN_VALUE) {
                if (this.mLayoutWidget.mWrapFixedHeight < size3) {
                    this.mLayoutWidget.setHeight(this.mLayoutWidget.mWrapFixedHeight);
                }
                this.mLayoutWidget.setVerticalDimensionBehaviour(DimensionBehaviour.FIXED);
            }
        }
        if ((this.mOptimizationLevel & 32) == 32) {
            int width2 = this.mLayoutWidget.getWidth();
            int height2 = this.mLayoutWidget.getHeight();
            if (this.mLastMeasureWidth != width2 && mode == 1073741824) {
                Analyzer.setPosition(this.mLayoutWidget.mWidgetGroups, 0, width2);
            }
            if (this.mLastMeasureHeight != height2 && mode2 == 1073741824) {
                Analyzer.setPosition(this.mLayoutWidget.mWidgetGroups, 1, height2);
            }
            if (this.mLayoutWidget.mHorizontalWrapOptimized && this.mLayoutWidget.mWrapFixedWidth > size2) {
                Analyzer.setPosition(this.mLayoutWidget.mWidgetGroups, 0, size2);
            }
            if (this.mLayoutWidget.mVerticalWrapOptimized && this.mLayoutWidget.mWrapFixedHeight > size3) {
                Analyzer.setPosition(this.mLayoutWidget.mWidgetGroups, 1, size3);
                if (getChildCount() > 0) {
                    solveLinearSystem("First pass");
                }
                size = this.mVariableDimensionsWidgets.size();
                int paddingBottom = paddingTop + getPaddingBottom();
                int paddingRight = paddingLeft + getPaddingRight();
                if (size <= 0) {
                    boolean z6 = this.mLayoutWidget.getHorizontalDimensionBehaviour() == DimensionBehaviour.WRAP_CONTENT;
                    boolean z7 = this.mLayoutWidget.getVerticalDimensionBehaviour() == DimensionBehaviour.WRAP_CONTENT;
                    int max = Math.max(this.mLayoutWidget.getWidth(), this.mMinWidth);
                    int max2 = Math.max(this.mLayoutWidget.getHeight(), this.mMinHeight);
                    int i8 = 0;
                    boolean z8 = false;
                    int i9 = 0;
                    while (i8 < size) {
                        ConstraintWidget constraintWidget = (ConstraintWidget) this.mVariableDimensionsWidgets.get(i8);
                        int i10 = size;
                        View view = (View) constraintWidget.getCompanionWidget();
                        if (view == null) {
                            i4 = width;
                            z4 = z8;
                            i5 = height;
                        } else {
                            i5 = height;
                            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
                            i4 = width;
                            if (layoutParams.isHelper || layoutParams.isGuideline) {
                                z4 = z8;
                            } else {
                                z4 = z8;
                                if (view.getVisibility() != 8 && (!z5 || !constraintWidget.getResolutionWidth().isResolved() || !constraintWidget.getResolutionHeight().isResolved())) {
                                    view.measure((layoutParams.width != -2 || !layoutParams.horizontalDimensionFixed) ? MeasureSpec.makeMeasureSpec(constraintWidget.getWidth(), 1073741824) : getChildMeasureSpec(i6, paddingRight, layoutParams.width), (layoutParams.height != -2 || !layoutParams.verticalDimensionFixed) ? MeasureSpec.makeMeasureSpec(constraintWidget.getHeight(), 1073741824) : getChildMeasureSpec(i7, paddingBottom, layoutParams.height));
                                    if (this.mMetrics != null) {
                                        this.mMetrics.additionalMeasures++;
                                    }
                                    int measuredWidth = view.getMeasuredWidth();
                                    int measuredHeight = view.getMeasuredHeight();
                                    if (measuredWidth != constraintWidget.getWidth()) {
                                        constraintWidget.setWidth(measuredWidth);
                                        if (z5) {
                                            constraintWidget.getResolutionWidth().resolve(measuredWidth);
                                        }
                                        if (z6 && constraintWidget.getRight() > max) {
                                            max = Math.max(max, constraintWidget.getRight() + constraintWidget.getAnchor(Type.RIGHT).getMargin());
                                        }
                                        z4 = true;
                                    }
                                    if (measuredHeight != constraintWidget.getHeight()) {
                                        constraintWidget.setHeight(measuredHeight);
                                        if (z5) {
                                            constraintWidget.getResolutionHeight().resolve(measuredHeight);
                                        }
                                        if (z7 && constraintWidget.getBottom() > max2) {
                                            max2 = Math.max(max2, constraintWidget.getBottom() + constraintWidget.getAnchor(Type.BOTTOM).getMargin());
                                        }
                                        z4 = true;
                                    }
                                    if (layoutParams.needsBaseline) {
                                        int baseline = view.getBaseline();
                                        if (!(baseline == -1 || baseline == constraintWidget.getBaselineDistance())) {
                                            constraintWidget.setBaselineDistance(baseline);
                                            z4 = true;
                                        }
                                    }
                                    if (VERSION.SDK_INT >= 11) {
                                        i9 = combineMeasuredStates(i9, view.getMeasuredState());
                                    } else {
                                        int i11 = i9;
                                    }
                                    z8 = z4;
                                    i8++;
                                    size = i10;
                                    height = i5;
                                    width = i4;
                                    i6 = i;
                                }
                            }
                        }
                        i9 = i9;
                        z8 = z4;
                        i8++;
                        size = i10;
                        height = i5;
                        width = i4;
                        i6 = i;
                    }
                    int i12 = size;
                    int i13 = width;
                    int i14 = height;
                    i3 = i9;
                    if (z8) {
                        this.mLayoutWidget.setWidth(i13);
                        this.mLayoutWidget.setHeight(i14);
                        if (z5) {
                            this.mLayoutWidget.solveGraph();
                        }
                        solveLinearSystem("2nd pass");
                        if (this.mLayoutWidget.getWidth() < max) {
                            this.mLayoutWidget.setWidth(max);
                            z2 = true;
                        } else {
                            z2 = false;
                        }
                        if (this.mLayoutWidget.getHeight() < max2) {
                            this.mLayoutWidget.setHeight(max2);
                            z3 = true;
                        } else {
                            z3 = z2;
                        }
                        if (z3) {
                            solveLinearSystem("3rd pass");
                        }
                    }
                    int i15 = i12;
                    for (int i16 = 0; i16 < i15; i16++) {
                        ConstraintWidget constraintWidget2 = (ConstraintWidget) this.mVariableDimensionsWidgets.get(i16);
                        View view2 = (View) constraintWidget2.getCompanionWidget();
                        if (view2 != null && (view2.getMeasuredWidth() != constraintWidget2.getWidth() || view2.getMeasuredHeight() != constraintWidget2.getHeight())) {
                            if (constraintWidget2.getVisibility() != 8) {
                                view2.measure(MeasureSpec.makeMeasureSpec(constraintWidget2.getWidth(), 1073741824), MeasureSpec.makeMeasureSpec(constraintWidget2.getHeight(), 1073741824));
                                if (this.mMetrics != null) {
                                    this.mMetrics.additionalMeasures++;
                                }
                            }
                        }
                    }
                } else {
                    i3 = 0;
                }
                int width3 = this.mLayoutWidget.getWidth() + paddingRight;
                int height3 = this.mLayoutWidget.getHeight() + paddingBottom;
                if (VERSION.SDK_INT < 11) {
                    int resolveSizeAndState = resolveSizeAndState(height3, i7, i3 << 16) & 16777215;
                    int min = Math.min(this.mMaxWidth, resolveSizeAndState(width3, i, i3) & 16777215);
                    int min2 = Math.min(this.mMaxHeight, resolveSizeAndState);
                    if (this.mLayoutWidget.isWidthMeasuredTooSmall()) {
                        min |= nexEngine.ExportHEVCMainTierLevel62;
                    }
                    if (this.mLayoutWidget.isHeightMeasuredTooSmall()) {
                        min2 |= nexEngine.ExportHEVCMainTierLevel62;
                    }
                    setMeasuredDimension(min, min2);
                    this.mLastMeasureWidth = min;
                    this.mLastMeasureHeight = min2;
                    return;
                }
                setMeasuredDimension(width3, height3);
                this.mLastMeasureWidth = width3;
                this.mLastMeasureHeight = height3;
                return;
            }
        }
        if (getChildCount() > 0) {
        }
        size = this.mVariableDimensionsWidgets.size();
        int paddingBottom2 = paddingTop + getPaddingBottom();
        int paddingRight2 = paddingLeft + getPaddingRight();
        if (size <= 0) {
        }
        int width32 = this.mLayoutWidget.getWidth() + paddingRight2;
        int height32 = this.mLayoutWidget.getHeight() + paddingBottom2;
        if (VERSION.SDK_INT < 11) {
        }
    }

    public void onViewAdded(View view) {
        if (VERSION.SDK_INT >= 14) {
            super.onViewAdded(view);
        }
        ConstraintWidget viewWidget = getViewWidget(view);
        if ((view instanceof Guideline) && !(viewWidget instanceof Guideline)) {
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            layoutParams.widget = new Guideline();
            layoutParams.isGuideline = true;
            ((Guideline) layoutParams.widget).setOrientation(layoutParams.orientation);
        }
        if (view instanceof ConstraintHelper) {
            ConstraintHelper constraintHelper = (ConstraintHelper) view;
            constraintHelper.validateParams();
            ((LayoutParams) view.getLayoutParams()).isHelper = true;
            if (!this.mConstraintHelpers.contains(constraintHelper)) {
                this.mConstraintHelpers.add(constraintHelper);
            }
        }
        this.mChildrenByIds.put(view.getId(), view);
        this.mDirtyHierarchy = true;
    }

    public void onViewRemoved(View view) {
        if (VERSION.SDK_INT >= 14) {
            super.onViewRemoved(view);
        }
        this.mChildrenByIds.remove(view.getId());
        ConstraintWidget viewWidget = getViewWidget(view);
        this.mLayoutWidget.remove(viewWidget);
        this.mConstraintHelpers.remove(view);
        this.mVariableDimensionsWidgets.remove(viewWidget);
        this.mDirtyHierarchy = true;
    }

    public void removeView(View view) {
        super.removeView(view);
        if (VERSION.SDK_INT < 14) {
            onViewRemoved(view);
        }
    }

    public void requestLayout() {
        super.requestLayout();
        this.mDirtyHierarchy = true;
        this.mLastMeasureWidth = -1;
        this.mLastMeasureHeight = -1;
        this.mLastMeasureWidthSize = -1;
        this.mLastMeasureHeightSize = -1;
        this.mLastMeasureWidthMode = 0;
        this.mLastMeasureHeightMode = 0;
    }

    public void setConstraintSet(ConstraintSet constraintSet) {
        this.mConstraintSet = constraintSet;
    }

    public void setDesignInformation(int i, Object obj, Object obj2) {
        if (i == 0 && (obj instanceof String) && (obj2 instanceof Integer)) {
            if (this.mDesignIds == null) {
                this.mDesignIds = new HashMap<>();
            }
            String str = (String) obj;
            int indexOf = str.indexOf("/");
            if (indexOf != -1) {
                str = str.substring(indexOf + 1);
            }
            this.mDesignIds.put(str, Integer.valueOf(((Integer) obj2).intValue()));
        }
    }

    public void setId(int i) {
        this.mChildrenByIds.remove(getId());
        super.setId(i);
        this.mChildrenByIds.put(getId(), this);
    }

    public void setMaxHeight(int i) {
        if (i != this.mMaxHeight) {
            this.mMaxHeight = i;
            requestLayout();
        }
    }

    public void setMaxWidth(int i) {
        if (i != this.mMaxWidth) {
            this.mMaxWidth = i;
            requestLayout();
        }
    }

    public void setMinHeight(int i) {
        if (i != this.mMinHeight) {
            this.mMinHeight = i;
            requestLayout();
        }
    }

    public void setMinWidth(int i) {
        if (i != this.mMinWidth) {
            this.mMinWidth = i;
            requestLayout();
        }
    }

    public void setOptimizationLevel(int i) {
        this.mLayoutWidget.setOptimizationLevel(i);
    }

    public boolean shouldDelayChildPressedState() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void solveLinearSystem(String str) {
        this.mLayoutWidget.layout();
        if (this.mMetrics != null) {
            this.mMetrics.resolutions++;
        }
    }
}
