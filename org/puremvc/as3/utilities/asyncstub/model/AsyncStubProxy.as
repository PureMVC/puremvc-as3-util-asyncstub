/*
 PureMVC Utility - Asynchronous Stub 
 Copyright (c) 2007-2008, Philip Sexton <philip.sexton@puremvc.org>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*/
package org.puremvc.as3.utilities.asyncstub.model
{
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;

	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
    
    /**
    *   An abstract class, to facilitate the actual resource proxies.
    */
	public class AsyncStubProxy extends Proxy implements IProxy
	{
		public static const MAX_DELAY_MSECS :int = 15000; //15 secs

		public function AsyncStubProxy( name :String ) 
		{
			super( name );
		}

        /**
        *   Simulate a slow async load, by a random delay, followed
        *   by a completion handler.
        */
        public function loadingActivity( onCompletion :Function ) :void 
        {
            // 0 <= Math.random() < 1
            var msecsDelay :Number = Math.random() * MAX_DELAY_MSECS;
            var timer :Timer = new Timer( msecsDelay, 1 );
            timer.addEventListener( TimerEvent.TIMER, onCompletion );
            timer.start();
        }

	}
}