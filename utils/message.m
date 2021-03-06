%Copyright (c) 2006, Franco Scarselli
%All rights reserved.
%
%Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
%
%Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
%Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
%
%THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.



function message(msg)
global dynamicSystem

printScreen=1;

if ~isempty(dynamicSystem) && isfield(dynamicSystem,'config') && isfield(dynamicSystem.config,'logFile')
    if dynamicSystem.config.useLogFile
        logfh = fopen(dynamicSystem.config.logFile,'a');
        if (logfh==-1)
            dynamicSystem.config.useLogFile=0;
            warn(0, ['I can''t open log file <' dynamicSystem.config.logFile '>. I disable logging.']);
        else
            printScreen=0;
            c=clock;
            fprintf(logfh,['%2.0f:%2.0f:%2.0f> ' msg '\n'],c(4),c(5),c(6));
        end
    end
end
    
if (printScreen)
    msg=strrep(msg,'%%','%');   %to write in a file we must use %% for %, so here we need to replace back %% with %
    disp(msg)
end
    