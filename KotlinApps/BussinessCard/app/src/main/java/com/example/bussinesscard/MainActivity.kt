package com.example.bussinesscard

import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.CornerSize
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.CardColors
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.CardElevation
import androidx.compose.material3.Divider
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.RectangleShape
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.bussinesscard.ui.theme.BussinessCardTheme
import java.time.format.TextStyle

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            BussinessCardTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    CreateBizCar()
                }
            }
        }
    }
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}

@Composable
fun CreateImageProfile() {
    Column(
        modifier = Modifier

            .background(Color.White)
            .fillMaxWidth(),
        verticalArrangement = Arrangement.Top,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Surface(
            shape = CircleShape,
            border = BorderStroke(0.5.dp, Color.LightGray),
            modifier = Modifier
                .size(150.dp)
                .padding(5.dp),
            shadowElevation = 4.dp,
            color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.5f)
        ) {
            Image(
                painter = painterResource(id = R.drawable.profile_image),
                contentDescription = "profile image",
                modifier = Modifier.size(15.dp),
                contentScale = ContentScale.Crop
            )

        }

    }
}

@Composable
fun CreateName(name: String)
{
    Column(
        modifier = Modifier

            .background(Color.White)
            .fillMaxWidth(),
        verticalArrangement = Arrangement.Top,
        horizontalAlignment = Alignment.CenterHorizontally
    )
    {

        Text(text = name, modifier = Modifier.padding(5.dp), style = MaterialTheme.typography.displayMedium, color = Color.Blue);

    }

}
@Composable
fun CreateNormalText(text:String)
{
    Column(
        modifier = Modifier
            .padding(10.dp)

            .background(Color.White)
            .fillMaxWidth(),

        verticalArrangement = Arrangement.Top,
        horizontalAlignment = Alignment.CenterHorizontally
    )
    {

        Text(text = text, modifier = Modifier.padding(2.dp),
            style = MaterialTheme.typography.bodySmall, color = Color.Blue);

    }
}


@Preview
@Composable
fun Content()
{
    Box(modifier=
    Modifier
        .fillMaxWidth()
        .fillMaxHeight()
        .padding(5.dp)){
        Surface(modifier = Modifier
            .padding(3.dp)
            .fillMaxHeight()
            .fillMaxWidth(),
            shape= RoundedCornerShape(corner= CornerSize(6.dp)),
            border=BorderStroke(width = 10.dp, color=Color.LightGray)){


        }


    }

}


@Composable
fun Portfolio(data: List<String>) {
    LazyColumn(
        modifier = Modifier
            .fillMaxWidth()
            .padding(5.dp)
    ) {
        items(data) { item ->
            Card(
                elevation = CardDefaults.cardElevation(
                    defaultElevation = 8.dp
                ),
                shape = RectangleShape,
                border = BorderStroke(0.5.dp, Color.LightGray),
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(5.dp)



            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.SpaceAround,
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(5.dp)
                        .border(
                            BorderStroke(2.dp, Color.Black)
                        )
                        .background(Color.LightGray)
                ) {

                    Surface(
                        shape = CircleShape,
                        border = BorderStroke(0.5.dp, Color.LightGray),
                        modifier = Modifier
                            .size(100.dp)
                            .padding(5.dp),
                        shadowElevation = 4.dp,
                        color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.5f)
                    ) {
                        Image(
                            painter = painterResource(id = R.drawable.profile_image),
                            contentDescription = "profile image",
                            modifier = Modifier.size(12.dp),
                            contentScale = ContentScale.Crop
                        )
                    }
                    Text(
                        text = item,
                        style = MaterialTheme.typography.headlineSmall,
                        color = Color.Blue
                    )
                }
            }
        }
    }

}

@Composable
fun ContentProjects(){
    Portfolio(data=listOf("Project1","Project2","Project3"))
}

@Preview
@Composable
fun CreateBizCar() {
    val buttonClickedState = remember{
        mutableStateOf(false);
    }
    var colors = CardDefaults.cardColors(
        containerColor = Color.White, //Card background color
        contentColor = Color.White  //Card content color,e.g.text
    )
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .fillMaxHeight()
    ) {
        Card(
            colors = colors, shape = RoundedCornerShape(CornerSize(15.dp)), modifier = Modifier
                .width(200.dp)
                .height(390.dp)
                .padding(12.dp),
            elevation = CardDefaults.cardElevation(
                defaultElevation = 8.dp
            )
        ) {
            Column (
                modifier = Modifier

                    .background(Color.White)
                    .fillMaxWidth(),
                verticalArrangement = Arrangement.Top,
                horizontalAlignment = Alignment.CenterHorizontally
            )
            {


                CreateImageProfile()
                Divider(thickness = 2.dp, color = Color.Blue, modifier = Modifier.padding(3.dp))
                CreateName("Alex")
                CreateNormalText(text = "Android Programmer")
                CreateNormalText(text = "@heyimjustalex")
                Column(modifier=Modifier.padding(0.dp,10.dp,0.dp,0.dp))
                {
                    Button( contentPadding = PaddingValues(20.dp), onClick =  {

                        buttonClickedState.value = !buttonClickedState.value



                    }){
                        Text("Portfolio", style = MaterialTheme.typography.headlineMedium)
                    }





                }
                if(buttonClickedState.value)
                {
                    ContentProjects()
                }
                else
                {
                    Box(){

                    }

                }

                  






            }

        }

    }
}





//@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    BussinessCardTheme {
        Greeting("Android")
    }
}