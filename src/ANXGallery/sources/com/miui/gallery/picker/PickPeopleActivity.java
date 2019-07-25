package com.miui.gallery.picker;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.picker.helper.Picker;
import com.miui.gallery.picker.helper.Picker.MediaType;
import com.miui.gallery.picker.helper.Picker.Mode;
import com.miui.gallery.picker.helper.Picker.ResultType;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class PickPeopleActivity extends PickerActivity {
    private PickPeoplePageFragment mFragment;

    /* access modifiers changed from: protected */
    public void done(int i) {
        Intent intent = new Intent();
        intent.putExtra("internal_key_updated_selection", copyPicker(getPicker()));
        setResult(i, intent);
        finish();
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i2 != 0) {
            List<String> list = (List) intent.getSerializableExtra("internal_key_updated_selection");
            if (list != null) {
                ArrayList arrayList = new ArrayList();
                for (String str : this.mPicker) {
                    if (!list.contains(str)) {
                        arrayList.add(str);
                    }
                }
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    this.mPicker.remove((String) it.next());
                }
                for (String str2 : list) {
                    if (!this.mPicker.contains(str2)) {
                        this.mPicker.pick(str2);
                    }
                }
                if (this.mPicker.getMode() == Mode.SINGLE || i2 == -1) {
                    this.mPicker.done();
                }
                return;
            }
            return;
        }
        this.mPicker.cancel();
    }

    public void onBackPressed() {
        done(2);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (this.mPicker != null) {
            setContentView(R.layout.picker_people_page_activity);
            boolean booleanExtra = getIntent().getBooleanExtra("pick_people", false);
            this.mFragment = (PickPeoplePageFragment) getFragmentManager().findFragmentById(R.id.people_page);
            this.mFragment.setIsPickPeople(booleanExtra);
            if (booleanExtra) {
                String stringExtra = getIntent().getStringExtra("pick_people_candidate_name");
                if (TextUtils.isEmpty(stringExtra)) {
                    stringExtra = getString(R.string.choose_people);
                }
                setTitle(stringExtra);
            }
        }
    }

    /* access modifiers changed from: protected */
    public Picker onCreatePicker() {
        Intent intent = getIntent();
        int intExtra = intent.getIntExtra("pick-upper-bound", 0);
        int intExtra2 = intent.getIntExtra("pick-lower-bound", 1);
        MediaType mediaType = MediaType.values()[intent.getIntExtra("picker_media_type", 0)];
        ArrayList arrayList = (ArrayList) intent.getSerializableExtra("picker_result_set");
        if (getIntent().getBooleanExtra("pick_people", false)) {
            arrayList = new ArrayList();
        }
        ResultType resultType = ResultType.values()[intent.getIntExtra("picker_result_type", 0)];
        SimplePicker simplePicker = new SimplePicker(this, intExtra, intExtra2, arrayList);
        simplePicker.setMediaType(mediaType);
        simplePicker.setResultType(resultType);
        return simplePicker;
    }

    /* access modifiers changed from: protected */
    public void onDone() {
        done(-1);
    }
}
