<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Главная</title>
</head>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Список</title>
  <link href="bootstrap/bootstrap.min.css" rel="stylesheet">
  <!--link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"-->
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<header>
  <%ArrayList<String> list = (ArrayList<String>) (request.getAttribute("list"));%>
  <div class="office-nav">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="getdata">Список сотрудников</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="form.jsp">Добавить сотрудника</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="profile?person=<%=list.get(0)%>">Профиль</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="chart">Графики</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logout">Выход</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
</header>
<body>
<div class="filter">
  <form action="show" method="get">
    <label for="sort">Сортировать</label>
    <select name="sort" id="sort">
      <option value="default">По умолчанию</option>
      <option value="namealph">Алфав. по имени</option>
      <option value="countyalph">Алфав. по округу</option>
      <option value="neighalph">Алфав. по району</option>
      <option value="age">По возрасту</option>
    </select>
    <label for="county">Округ:</label>
    <select id="county" name="county">
      <option value="ВАО">ВАО</option>
      <option value="ЗАО">ЗАО</option>
      <option value="ЗелАО">ЗелАО</option>
      <option value="САО">САО</option>
      <option value="СВАО">СВАО</option>
      <option value="СЗАО">СЗАО</option>
      <option value="ТиНАО">ТИНАО</option>
      <option value="ЦАО">ЦАО</option>
      <option value="ЮАО">ЮАО</option>
      <option value="ЮВАО">ЮВАО</option>
      <option value="ЮЗАО">ЮЗАО</option>
    </select>
    <label for="neigh">Район:</label>
    <input type="text" id="neigh" name="neigh" class="neigh field"><br><br>
    <button type="submit">Показать сотрудников</button>
  </form>
</div>
<div class="search">
  <form action="find" method="GET">
    <label for="person">Поиск</label>
    <input type="text" id="person" name="person">
    <button type="submit">Найти</button>
  </form>
</div>
<div class="list">
  <ul class="list-content">
    <%
      if ((list.get(0))=="Ничего не найдено"){
        out.print("<li nav-item>" + "Ничего не найдено" + "</li>");
      } else {
        for(int i = 0; i < list.toArray().length; i++){
          out.print("<li nav-item>" + "<a href='/Office-1.0-SNAPSHOT/profile?person="+list.get(i)+"'>" + list.get(i) + "</a>" + "</li>");
        }
      }
    %>
  </ul>
</div>
</body>
</html>