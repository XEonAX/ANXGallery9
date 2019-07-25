package com.miui.gallery.collage.drawable;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import com.miui.gallery.R;
import com.miui.gallery.collage.core.poster.SpecifyDrawableModel;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout;
import com.miui.gallery.util.BuildUtil;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class RectTimeDrawable extends Drawable {
    private AutoLineLayout mDateLayout;
    private float mDateOffsetY;
    private RectF mDateRectF;
    private float mShortLineLength;
    private float mShortLineOffsetY;
    private float mShotLineStartX;
    private Paint mStrokePaint = new Paint(1);
    private Rect mStrokeRect = new Rect();
    private AutoLineLayout mYearLayout;
    private float mYearWidth;

    public RectTimeDrawable(Resources resources, SpecifyDrawableModel specifyDrawableModel) {
        float f = specifyDrawableModel.extras.letterSpace;
        float dimension = resources.getDimension(R.dimen.collage_rect_time_date_paint_size);
        float dimension2 = resources.getDimension(R.dimen.collage_rect_time_year_paint_size);
        float dimension3 = resources.getDimension(R.dimen.collage_rect_time_stroke_width);
        float dimension4 = resources.getDimension(R.dimen.collage_rect_time_short_line_length);
        float dimension5 = resources.getDimension(R.dimen.collage_rect_time_short_line_start_x_offset);
        float dimension6 = resources.getDimension(R.dimen.collage_rect_time_date_offset_y);
        float dimension7 = resources.getDimension(R.dimen.collage_rect_time_short_line_offset_y);
        float dimension8 = resources.getDimension(R.dimen.collage_rect_time_width);
        float dimension9 = resources.getDimension(R.dimen.collage_rect_time_height);
        int parseColor = Color.parseColor("#80000000");
        long currentTimeMillis = System.currentTimeMillis();
        String dateString = getDateString(currentTimeMillis, resources);
        String yearString = getYearString(currentTimeMillis, resources);
        this.mDateLayout = new AutoLineLayout();
        this.mDateLayout.setText(dateString);
        this.mDateLayout.setLetterSpace(f);
        Paint paint = this.mDateLayout.getPaint();
        paint.setTextSize(dimension);
        paint.setColor(parseColor);
        this.mDateLayout.countText();
        this.mYearLayout = new AutoLineLayout();
        this.mYearLayout.setText(yearString);
        this.mYearLayout.setLetterSpace(f);
        Paint paint2 = this.mYearLayout.getPaint();
        paint2.setTextSize(dimension2);
        paint2.setColor(parseColor);
        this.mYearLayout.countText();
        int round = Math.round(dimension8 / 2.0f);
        int round2 = Math.round(dimension9 / 2.0f);
        this.mStrokeRect.set(-round, -round2, round, round2);
        this.mStrokePaint.setStyle(Style.STROKE);
        this.mStrokePaint.setStrokeWidth(dimension3);
        this.mStrokePaint.setColor(parseColor);
        RectF rectF = new RectF();
        this.mDateRectF = new RectF();
        this.mYearLayout.getTextRect(rectF);
        this.mDateLayout.getTextRect(this.mDateRectF);
        this.mDateOffsetY = (rectF.height() / 2.0f) + (this.mDateRectF.height() / 2.0f) + dimension6;
        this.mShortLineOffsetY = (rectF.height() / 2.0f) + dimension7;
        this.mYearWidth = rectF.width();
        this.mShotLineStartX = (-(this.mYearWidth / 2.0f)) + dimension5;
        this.mShortLineLength = dimension4;
    }

    private static String getDateString(long j, Resources resources) {
        return new SimpleDateFormat(resources.getString(R.string.collage_drawable_rect_date_month_day), BuildUtil.isInternational() ? Locale.getDefault() : Locale.US).format(Long.valueOf(j));
    }

    private static String getYearString(long j, Resources resources) {
        return new SimpleDateFormat(resources.getString(R.string.collage_drawable_rect_date_year), BuildUtil.isInternational() ? Locale.getDefault() : Locale.US).format(Long.valueOf(j));
    }

    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        float width = ((float) bounds.width()) / ((float) getIntrinsicWidth());
        canvas.save();
        canvas.translate((float) bounds.centerX(), (float) bounds.centerY());
        canvas.scale(width, width);
        canvas.drawRect(this.mStrokeRect, this.mStrokePaint);
        this.mYearLayout.draw(canvas);
        canvas.translate(0.0f, -this.mDateOffsetY);
        float width2 = this.mYearWidth / this.mDateRectF.width();
        canvas.save();
        canvas.scale(width2, width2, 0.0f, 0.0f);
        this.mDateLayout.draw(canvas);
        canvas.restore();
        canvas.translate(0.0f, this.mDateOffsetY + this.mShortLineOffsetY);
        canvas.drawLine(this.mShotLineStartX, 0.0f, this.mShotLineStartX + this.mShortLineLength, 0.0f, this.mStrokePaint);
        canvas.restore();
    }

    public int getIntrinsicHeight() {
        return this.mStrokeRect.height();
    }

    public int getIntrinsicWidth() {
        return this.mStrokeRect.width();
    }

    public int getOpacity() {
        return -2;
    }

    public void setAlpha(int i) {
    }

    public void setColorFilter(ColorFilter colorFilter) {
    }
}
