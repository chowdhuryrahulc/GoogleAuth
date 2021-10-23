// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'google_login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginUI(),
    );
  }

  loginUI() {
    return Consumer<X>(builder: (context, model, child) {
      if (model.googleAccount != null) {
        return Center(child: logInUI(model));
      } else {
        return loginControls(context);
      }
    });
  }

  logInUI(X model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.googleAccount!.photoUrl ?? '').image,
          radius: 50,
        ),
        Text(model.googleAccount!.displayName ?? ''),
        Text(model.googleAccount!.email),
        ActionChip(
            avatar: Icon(Icons.logout),
            label: Text("Logout"),
            onPressed: () {
              Provider.of<X>(context, listen: false).logout();
            })
      ],
    );
  }

  loginControls(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            child: Image.network(
                "https://user-images.githubusercontent.com/1531669/41761219-0e0e4d80-7629-11e8-9663-aabe62025d57.png"),
            // "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMNDQ0NDQ4QDQ0PDw4QDg0QDQ8PEA8PFREWFhYVFxgYHSggGRolGxUTIjMtJSkrLi4uFx8zODM4NygtLisBCgoKDg0OGxAQFy0lICYvLS0uNS0tLS0tLi0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAHYBrAMBEQACEQEDEQH/xAAbAAEBAAMBAQEAAAAAAAAAAAAAAQIEBgUDB//EAEAQAAICAQIEAwYCBQkJAAAAAAABAgMRBBIFITFRBhNBIjJhcYGRFKFScrGy8AczNDU2QnPBwxUWQ2J0goOis//EABoBAQADAQEBAAAAAAAAAAAAAAABAgMEBQb/xAAvEQEAAgIBAwIEBQMFAAAAAAAAAQIDEQQSITFBUQUTgcEiMjRhcTNDoRQVQpHR/9oADAMBAAIRAxEAPwD9wAMDEABCRAIQBIhAhIAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAoACkABQBIyQAgVAAMgIAAgEAARgRgQkAIAAYAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALgAAAoAgUCoCgAKBQKAYEAgBgQBgBgAAwAwAwBABIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAuAGCAwAAYAYAICoCgAKBGAAgBgEgKBAAAAAAgAC4AYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAgFAAAAAABQI0AAAZAAIAAgBAZAQAAA8bW+KNJRJwnqIuS5NQUp4fx2oytnx18y7cXw/kZI3Wnb/AKbHDeN6fV8qLozl+hzjL7PmTTJW3iWWbiZsP566ehg0c4AAAAAElJLq0vm0iYiZ8I3AQlK7FNZjJSXeLTX5EzEx5RExPhkQkAAAMK7IzWYyUlnGYtNZ+hMxMeURMT4ZkJAAADGdkY4UpKLk8RTaWX2RMVmfEImYhkQl8Xqq1YqnZDzWsqvfHe1jPTqW6LdPVrsr1RvW+77FVgDFyS5NpP4tImImUbhkQkAAAAAD406quyUo12QnKDxOMZxk4vOOaXToy9qWrETMa2rFontEvsUWAAACgAAFAAYAUCgUAwMQACIGQAABx38oXEbYVKmjKjJZvnH3lH0SxzwzzOZzaUyRh33l7Pwjj47W+Zk+jQ4J4BU6o2auycZSSaqhhbU+7afM1x8TcbtLp5Xxqa2muKI1HrL0OHeBIUaqN3nSnVDEoQfsz3/GS9DSnFitt7c2f4xfLh6OnvLrzqeMAAAAAB+caSFes1mpjxO+dU4zarg57Irm+WXyWFj5nv3m+HDWePWJ9/V5dYrkyTGWXQcG4VbpFqoztV2hlXN1re3NLHpywsrPQ4ORnpl6ZiNX9fZ04sdqb3O6sPC+u09HD7r642VUwsk5KySnJyxHpj5pFuZiy3zxS2pmY9EYL0rjm0eGH++8VB2S0l8a3yrny2zeemei9e/Qn/bLdXTF436o/wBZGt9M6buu8UwojpJzqm46mCmsNNwXLqvXr6GOPg2yTaImPwtL8mKxEzHlhofFcbdTDTWae3Tys/m3YsZ7ZXpktk4E1x/MraJ17Ipyom3TMadBfjZPKytsspcsrBxV31Rp028OR8PcSo0vD9TqKKbVXC5boTsjKTk1Fcn0xzR6fJwZcuetLzG5hxYclKY5tEPtZ42jGMLPwt/kyxm1rEU/VJ9JFY+G2mZr1xv2WnmRrfTOnUUWqyELIPMZxUovumso820TWZiXXExMbh5ej47G3UarTyg65aZOUpNpqUU+q/J/U6L8W1aVvE76mNc0Taa+zX0fiiu3SajVqEoxoeJVtrc+mMfPJpfg3plrjmfKteTW1Jt7PM43rqNQuG3X02p2zbqUbIrb7cV7XfPJ8jo4+LLj+ZSlo7eWWW9L9FrR5fDjHH7q+J1xjC9VwzF6df8AHw5e1Fdny+xpg4mO3GmZmN+/srkz3jNERv8A9fPieu8rjVV8q5yfkQflRjmzdKuWI478y2HF18OaRMefP1VyX6eRFtejoOCeJI6u6enlTPT3RTlsn6pdfk+aODkcO2KkXiYmP2dWLkRknp1qW/xzWvTaW+9LMoQbin03PkvzaMePi+blrT3aZb9FJs5TgXhqOv0/4vV22yttcnFqfupNrP3R6fJ5s4Mny8VY1Djxcf5teu8+XteGtNfpK7q9ZNSpre6qxz3NQWc57LCT+5x8u+LLaLYo7z5b4K3xxMXns05+NoZlKGlunRF4d6WI/wAfNm0fDLeJvG/ZT/WR5is6evqePU16WOsct1UktmF7UpP+6l36/Y5KcXJbL8vXdtbPSKdfo8zS+MYSsrhfp7dNG3Hl2TXsvPT0XI6L/DrRWZpaJ150yry43qYmNtzjviOGjnClVzvvmsqqHXHoZcbh2zRNt6iPWV8vIjHOtbl8eG+KY36mvS+RbVZJScvMxHY1FvDXXovzL5eDbHjnJ1RMfsrTkxa/Tru8zwZJR1nFZNpJWSbb6JKyzmdHPiZxYoj2+0MuLOsl5bU/GsMylXprrKIPEr0sRX8fFmcfDbdom8RPsvPMj0rOnSaPVRvrhbW90JrMWefek0tNbeYdVbRaNw+xVZcAAAAAAAxYBAAMgDAjAgCIGQAAByPiW+NGo8y14h7D+LS6pL16HyHxLj5LfEI1G/EvRx8nHh40ze2vLotYvxGlsVMk3bVLy5ZwvajyeT7LDaK2rM+HlW/HT8Pq/N+K8D1Wjq8262KjlRSjfNybfZH0WHk4M1umtf8ADy8mHLjjcz/l1P8AJ05PS2ynKUk7ntcm30jHPX4nm/FYrGWIiPR2cLc0mZdWeY7AAAAknyeOb9EBxf4/R8QlbDiFMNLfW9qlKxxk0v8AmwunZnrfK5HHiLYbdUS4OvFl3GSNS1fC1zjZxDT02St0cKbXCT6J9E12ys/PBrzaxNcd7Rq242rx572rE7hoaaqU+BX7cvbqoylj9FRiv2tP6G97RXnV37MqxM8ade70eN8Wos4PTTXZHzNtEfKT9qLjjdlenRmHG4+WvLm1o7d+7TLlpOCIiXy4n14D+rV+9WWw/wB/6/dGT+23/FP9bcN+cP8A6GHC/S5WnI/rUddqf5uz9SX7GeXT80O63iX5xw3+pNd/1EP9M9/L+sp/Dyqfp7fy9bin9n6P1aP3jmw/r5+rbJ+mh03h7+g6T/Aq/dR53J/rW/mXXh/p1/hx3jJy02usnWv6ZpvL5fpNqL/JR+56vAiMuCIt/wAZ24eTumTcesNHjWjlopS0UOcdVDSv/wAkXh/+xvx8kZ4+dPmu2eWk456I9dPY8Y0KqfCa49ISUV8k60cnAt1Rlt7t+THTNIZeIro1ca0VlklCuNcd028Jc5r/ADRHFrN+HetfO05piuesytk1LxBTKLUoypTi10adUsNERGuBbfv9yZ3yY/hlX/aGX+F/pIT+g+v3I/U/R7/iXSyv0WoqgszcMxXdxalj8jh4uSMeatp93Vnr1Y5iHL8F12mv4dHR6q96eVUnn2vLk8SbWG18T0eRhzU5E5cddxP1cmK9LYui0600eAVuyni9dMp2R8rFbbbckpSx9Wv2m3KmK3xTaIjv3Z4Yma3iG/wjjGnhwedM5xVqhdF1P3pSk3jC9eqMc/Gy25cWiO3buvjy0jBqZ7vJ1WlnHhOislF+WtRZJrHSEvdfyeH9zqpkrPKvEeda+rG1ZjDWZ93reNeJ06rT6erTTjdbKyLjGHOUVtaw+zy1y+By8DDkxZLWyRqNerblZK3rEVnuaixaXjVVmpe2Dpgo2S91Pytuc/NP7isTl4c1x+d/cmejPE29mVerhfx+qdM42Q8tx3ReU2qpZ5+pE47U4MxaNd/umLRbkxMNbg1UrHx2FfOclYoper32cjTkWisYJn9vspiiZ+ZENPg0t+knVLicdLD21PTSoi20+uHnMsmvIiYzRaMPVPpO1MXempvr9nbeFNPGrRVRrt8+t7pRs2OGU5N4w28Hkcy83zTNo1Lv49YrjiInb1zlbgAAAAAAMWAQADIAwIwIBYgZAAIB4fingC19S2tQury65Po89Yv4MyyY4tH7ubk8f51deri6NRxDhualCxQTeIurza/+1pPBhE5Kdnm1tyMH4Yj7so6DXcVsi7lOME/fsh5dcF64jyyzu4PMzYL71uJTFM+e34vD9E4ZoY6Wmuiv3YLGX1b9W/i2WzZbZbze3q9fHSKV6YbRmuAAAADR1vB6NRLddRXOX6Tj7X3Rtj5GXHGq2mGdsVLd7Q+um0FVMHXVVCuuWd0YxSTysPPcrfLe9uq07lNaVrGoh8LNCqNNbXoqaoycZONbWK5TaxzLRkm+SJy2n7qzTprMUhxuo4RfqI+RDhlWjlKS829Si1y7c+S+WT16cjFjnrnLNvaHDbFe/wCHoiP3dlVwerZp42Vxslp4wjXOSy4tY5r6pHkTyL7tMTrfl3xirqNx4ffUcPqtshbZVGdlfuTay4888vqUrlvWs1ie0pmlZncw2JRymnzT5NfAovLShweiNU6I0QVU2pTr2+zJrHN/ZGs58k2i02ncM4xUiNa7PpZw6qVK08qoulYSra9lJdOREZbxbri3f3TOOs16Zjs+9NSrjGEEowilGMV0SXRFLWm07laIiI1D46rQVXSrlbXGyVbzW5LLi+XT7ItTLekTFZ1tW1K27zBqNBVbOuyyqM51vNcpLLi855fVCuW9YmtZ1ElqVtO5g1egqucJW1xslW8wclna+XT7ImmW9ImKzrZalbd5hjr+GU6nb59Ubdvu7lzX1GPNkx/knRfHW/5oIcMpjZG5VQVsIqEZ49qMUsJL4YE5rzWa9XY+XWJ3ruy/2fV534jy4+fjHm49rGMYz8h82/R0b7HRXq6td2yZrvO1XAtNdNzs09cpvrLbhv546m9OVmpGq2llbDjtO5ht6XSwpjsqhGuK/uxior8jK97Xndp2vWsVjUQ07eA6adnmS01Tm3lvYub7tdGaxys0V6YvOlJw45nfS350xlFwlGMoNYcGk4tdsGMWmJ3E92k1iY00tJwTT0T8yrT1wn6SUea+Wehrk5OW8dNrTMKVw0rO4h53iim2bq26KrW0pS3QlLbYp+ji/RY7HRw7Uje8k1n/AAy5FbTrVYmHn+HOCW/jPxl1ENJXCLjVp449Y7fT5t8+bbN+VyafJ+VW3VM+ZZYMNvmddo1+zqNLw+qmVk6qo1zsebJRWHJ5b5/Vs86+W94iLTvTrrStZ3ENe/gOmsm7J6auU28t7er+PcvXlZqx0xadKzgxzO5q34QUUoxSjFLCSWEkYTMzO5aRGmQSAAAAABQMGAAAZAQCMAAT5gZgAAACAAKAAAAAAAAAATAFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwPmBQAGQEAjAARgZRkBkAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAwlICICgAMgDAjAgEYEAyUgLuQF3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuA3LuBN4GLkBEBkAAAZAGBAIAYEYEAgEwSAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFAAAKQKAAqAoACgUABAIAAgEYACAMEiAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAuCBQABAUCgUABQAACAQABAGAIAAATADBIYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAYAECgAAFwAAoACgAKAAAQABAIBQIAAAQASAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgVAAAFAAAKBQAH/2Q=="),
            // "nDZmU6hkYEMXTiFoKQeX9HYCp942KDmOGEUHSjx4QC7XLJGreLDGbqVwFQDbotc3NyKuU2xCKYAXsnXsDE3q8BjCEQ5WEiU+p7n4/x46Txx6SDFmSu60YWxvrrj++77v5+gXrfOpiK38oaEXVdd4Pklpp0mYuowrCcOfIXJHCUunt4O37CihgYtJggVPlyRNkdpfAM+OpD7fa6N9C1cb/UzXHiNHFwm5Ys0+OCljpNUO0p0BkG0naZ8Cbax6oIVWczyPtTD7LLqucGG0bsToXeNlyOSKrfx9cm6TxyS5R6iNW9M241wIc4yJvD1rsdXrXlejY8vv40wIT4qYmpf7bYLN1J6S3x2PYWT2ceN1vYWwpHyNU2uBR/DwvqeTNRhKBpljgW+aredP6sE1yh6nTaYN8D35E3F781bAfD4yat/hGIwMm9KuMmqC64dWyzNeZvCjC24hzNmI5vZCfQNxuG5zVyRIGHNTW86YQyY+AuWiYFlwFh7nmO4jPHuchjLRMgAv3gI42SBFcy9WXUD2BG7/KJGOWK4yhzYqVOty9IwwVNBNpT3TNA2LXtSrTRAo6DqrlNNM1PGeLfQcgxNNYNRt5cuNnlZ4u2J1JuX79+/fvkj/Prnv7DYG41vk1UXPyrKgbPcauN9kOd+tbXGRAzqL4O1dthWXfBXjpt3XCqzvid3MAj0b0iMb8I5g7KImu/CUThVRMtXl6ANg0FU7eOFTiiuePMq/pK5UmNaDJy44ytPG71p9u7ksv79H8pd0E7xGXKrqClvFNjcGmm9WnafumKL/Pp9/dJkwhfDDLCx23ttTrcWvtF7nlfx++m/81tS7eg1XRzhXHjeaWyvjmV7L9yDzhFTQjq9dXWdNnzL+v1Pl/m9uy3Rrt6yxg0iliajYDdd8HOKZrjnn6QYGHXal70uvw2/cXjyagXem7e3ptkVvuULoFmklvHBgCrDg2B4+823a+NPVMy3TYBvXq/xldjOvnGg08kYwrdRP1SNHoQqGDSzLMl3UvVtvu978v7lqx9Br14/WesTvx1+oiIiT/XgGbLWO6r6ll/Xmtbx8bpfZ+ovjHYv/XG00tL4lJbGp7Q0PqWl8SktjU9paXxKS+NTWhqf0tL4lJbGp7Q0PqWl8SktjU9paXxKS+NTWhqf0tL4lJbGp7Q0PqWl8SktjU9paXxK62p8N34kq/Htj67Gl98FPavzX7bVuk2r+CzEF9KZu3uV993WX6A4PqvGZyK+Dwrq3YWo1i6F9IwPHzTwofc8OHjw9DdaaujDD1bxofl9cHT0K61919HREdKDoQ/wEYGPmx/gOzr6tdZeC+lV+HoNfGB+3P609lwA78FB7TsRX8UPAAJBrf3Wgwa9Cp/kxwlq7bUA0uFhbXzEIIiP8xMEtfZbhzW9Gh+3Pw5Qa+8FpExJD/BV/BCglgoyl/QQn+An/yy2xri3koR6NT2Or+K3JKi1v6pQkQa+JUAtNUTa+DRCddTckDOIlsL6Hx8TjShUEkEgAAAAAElFTkSuQmCC"),
            // Image.asset(
            //   "assets\images\download.png",
            //   width: 250,
            // ),
            onTap: () {
              Provider.of<X>(context, listen: false).login();
            },
          )
        ],
      ),
    );
  }
}
