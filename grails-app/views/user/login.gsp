<g:applyLayout name="bootstrapTemplate">
    <content tag="body">
        <div class="jumbotron text-center">
            <h1>Login</h1>
        </div>

        <g:if test="${flash.error}">
            <div class="alert alert-danger">
                ${flash.error}
            </div>
        </g:if>

        <g:form action="processLogin" >
            <div class="form-group">
                <label for="email">E-Mail</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="i.e.: some@email.com"/>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" class="form-control" />
            </div>

            <div class="form-group col-xs-12">
                <button type="submit" class="btn btn-lg btn-primary" style="width: 100%">Login</button>
            </div>
        </g:form>

    </content>
</g:applyLayout>