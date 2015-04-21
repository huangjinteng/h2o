? my $ctx = $main::context;
? $_mt->wrapper_file("wrapper.mt")->(sub {

<title>Configure - H2O</title>

?= $_mt->render_file("header.mt")

<div id="main">

<h2>Configure</h2>

<h3>Quick Start</h3>

<p>
In order to run the H2O standalone HTTP server, you need to write a configuration file.
The minimal configuration file looks like as follows.
</p>

<?= $ctx->{code}->(<< 'EOT')
listen:
  port: 8080
user: nobody
hosts:
  "myhost.example.com":
    paths:
      /:
        file.dir: /path/to/the/public-files
access-log: /path/to/the/access-log
error-log: /path/to/the/error-log
pid-file: /path/to/the/pid-file
EOT
?>

<p>
The configuration instructs the server to:
<ol>
<li>listen to port 8080</li>
<li>under the privileges of <code>nobody</code></li>
<li>serve files under <code>/path/to/the/public-files</code></li>
<li>emit access logs to file: <code>/path/to/the/access-log</code></li>
<li>emit error logs to <code>/path/to/the/error-log</code></li>
<li>store the process id of the server in <code>/path/to/the/pid-file</code>
</ol>
</p>

<p>
Enter the command below to start the server.
</p>

<?= $ctx->{code}->(<< 'EOT')
% sudo h2o -m daemon -c /path/to/the/configuration-file
EOT
?>

<p>
The command instructs the server to read the configuration file, and start in <code>daemon</code> mode, which dispatches a pair of master and worker processes that serves the HTTP requests.
</p>

<p>
To stop the server, send <code>SIGTERM</code> to the server.
</p>

<?= $ctx->{code}->(<< 'EOT')
% sudo kill -TERM `cat /path/to/the/pid-file`
EOT
?>

<h3>Command Options</h3>

<h3>Configuration Directives</h3>

<p>
Under construction.
For the meantime, please refer to <a href="https://gist.github.com/kazuho/f15b79211ea76f1bf6e5" target="_blank">the output of <code>--help</code></a>.
</p>

</div>

? })