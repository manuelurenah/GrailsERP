<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Login</h1>
        </div>
    </content>
    <content tag="body">
        <g:if test="${error}">
            <div class="alert alert-danger">
                There was an error signing in.
                <br>
                Username or password seem to have been mistaken.
            </div>
        </g:if>

        <g:form url="/login/authenticate" >
            <div class="form-group">
                <label for="username">E-Mail</label>
                <input type="email" name="username" id="username" class="form-control" placeholder="i.e.: some@email.com"/>
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