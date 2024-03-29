package tchunaisoft.com.br.betweenactivities;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.EditText;
import android.widget.Toast;

public class BetweenMainActivity extends AppCompatActivity {

    public static final int CONSTANTE_TELA1 = 1;
    public static final int CONSTANTE_TELA2 = 2;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_between_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
    }

    public void sendTela1(View view)
    {
        EditText nome = (EditText) findViewById(R.id.nome);
        EditText email = (EditText) findViewById(R.id.email);

        Bundle parametros = new Bundle();
        parametros.putString("nome",nome.getText().toString());
        parametros.putString("email", email.getText().toString());

        Intent intent = new Intent(this, Tela1Activity.class);
        intent.putExtras(parametros);
        startActivityForResult(intent, CONSTANTE_TELA1);
    }

    public void sendTela2(View view)
    {
        EditText nome = (EditText) findViewById(R.id.nome);
        EditText email = (EditText) findViewById(R.id.email);

        Bundle parametros = new Bundle();
        parametros.putString("nome",nome.getText().toString());
        parametros.putString("email", email.getText().toString());

        Intent intent = new Intent(this, Tela1Activity.class);
        intent.putExtras(parametros);
        startActivityForResult(intent,CONSTANTE_TELA2);
    }

    protected void onActivityResult(int codTela, int resultado, Intent intent)/*Eh definido pelas constantes,,eh o int do setResult da tela q tá chamando,,eh a Intent*/
    {
        if(codTela == CONSTANTE_TELA1)
        {
            Bundle parametros = intent.getExtras();
            if(parametros != null)
            {
                Toast.makeText(getApplicationContext(), "Tela1 » Resultado: " + resultado + " | " + parametros.getString("msg"),Toast.LENGTH_LONG).show();
            }
        }
        if(codTela == CONSTANTE_TELA2)
        {
            Bundle parametros = intent.getExtras();
            if(parametros != null)
            {
                Toast.makeText(getApplicationContext(), "Tela2 » Resultado: " + resultado + " | " + parametros.getString("msg"),Toast.LENGTH_LONG).show();
            }
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_between_main, menu);
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
}
