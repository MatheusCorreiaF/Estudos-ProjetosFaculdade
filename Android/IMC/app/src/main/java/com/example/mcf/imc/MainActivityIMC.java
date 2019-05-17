package com.example.mcf.imc;

import android.content.Context;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;


public class MainActivityIMC extends ActionBarActivity {

    EditText peso;
    TextView resultado;
    EditText h;
    Button calcula;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_activity_imc);

        calcula = (Button) findViewById(R.id.calcula);
        peso = (EditText) findViewById(R.id.peso);
        h = (EditText) findViewById(R.id.h);
        resultado = (TextView) findViewById(R.id.resultado);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main_activity_imc, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    public void calculaImc(View v)
    {
        Double auxP,auxH;

        if(peso.getText().toString().isEmpty()) {
            Context context = getApplicationContext();
            CharSequence text = "Informe o peso";
            int duration = Toast.LENGTH_LONG;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }
        else if(h.getText().toString().isEmpty())
        {
            Context context = getApplicationContext();
            CharSequence text = "Informe a altura";
            int duration = Toast.LENGTH_LONG;
            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }
        else {
            auxP = Double.parseDouble(peso.getText().toString());
            auxH = Double.parseDouble(h.getText().toString());
            resultado.setText("" + auxP / (auxH * auxH));
        }
    }
}
