<div class="row">
    <div class="s12">
        <h1> Product Overview </h1>
        <hr>
        <g:if test="${purchases && purchases.size() > 0}">
            <table class="table-responsive">
                <thead>
                <tr>
                    <th data-field="user">User</th>
                    <th data-field="total">Order Total</th>
                    <th data-field="created">Date Created</th>
                </tr>
                </thead>

                <tbody>
                <g:each in="${purchases}" var="p">
                    <tr>
                        <td>${p.user.name} ${p.user.lastname}</td>
                        <td>${p.total}</td>
                        <td>${p.dateCreated}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </g:if>
        <g:else>
            <p> Sadly, there's no data to show right now. Try again later.</p>
        </g:else>
    </div>
</div>