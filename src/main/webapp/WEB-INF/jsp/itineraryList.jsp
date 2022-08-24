<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<%@page import="com.techelevator.io.csvFileWriter"%>

<c:url var="likeJs" value="/js/like-button.js"/>
<script type="text/javascript" href="${likeJs}"></script>
<form action="/itinerary/delete" method="POST">
        <table>
            <h1>Upcoming Trips</h1>
            <tr>
                <th>Trip Name</th>
                <th>Start Date</th>
                <th>End Date</th>
            </tr>

            <c:forEach items="${itineraries}" var="itinerary">
                <c:if test="${!itinerary.past}">

                    <tr>
                        <td>
                            <c:out value="${itinerary.name}"/>

                        </td>
                        <td>
                            <c:out value="${itinerary.fromDate}"/>
                        </td>
                        <td>
                            <c:out value="${itinerary.toDate}"/>
                        </td>

                        <td><a href="/itinerary/edit/${itinerary.irineraryId}">Edit</a></td>
                        <td><a href="/landmark/list/${itinerary.irineraryId}/${userName}">View Landmarks</a></td>
                        <td><form method="POST" action="/itinerary/delete/${itinerary.irineraryId}/1"><input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                            <input type="submit" value="Delete" onclick = "return confirm('Confirm Deletion of ${itinerary.name} from itineraries');" /></form></td>
                        <td><a href="/itinerary/edit/download/${itinerary.irineraryId}">Download your Itinerary (.csv)</a></td>
                        <td><a href="https://labs.mapbox.com/community/nonprofit-route-tool/#/authoring" target="_blank">
                                ${itineraries.size() < 3 ? "" : "Route Your Trip"}
                        </a></td>

                    </tr>

                </c:if>


            </c:forEach>
        </table>
        <table>
            <h1>Past Trips</h1>
            <tr>
                <th>Trip Name</th>
                <th>Start Date</th>
                <th>End Date</th>
            </tr>

            <c:forEach items="${itineraries}" var="itinerary">
                <c:if test="${itinerary.past}">

                    <tr>
                        <td>
                            <c:out value="${itinerary.name}"/>

                        </td>
                        <td>
                            <c:out value="${itinerary.fromDate}"/>
                        </td>
                        <td>
                            <c:out value="${itinerary.toDate}"/>
                        </td>
                        <td><a href="/landmark/list/${itinerary.irineraryId}/${userName}">View Landmarks</a></td>
                        <td><form method="POST" action="/itinerary/delete/${itinerary.irineraryId}"><input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                            <input type="submit" value="Delete" onclick = "return confirm('Confirm Deletion of ${itinerary.name} from itineraries');" /></form></td>
                        <td><a href="/itinerary/edit/download/${itinerary.irineraryId}">Download your Itinerary (.csv)</a></td>
                        <td><a href="https://labs.mapbox.com/community/nonprofit-route-tool/#/authoring" target="_blank">
                            ${itineraries.size() < 2 ? "" : "Route Your Trip"}
                        </a></td>
                    </tr>
                </c:if>


            </c:forEach>
        </table>

        <p><a href="/itinerary/create/${userName}">add itinerary</a></p>

</form>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />