<?php
{assign var="data" value=$entityData['struct'][$entityKey]}

namespace {$entityData['moduleNamespace']}\actions;

use mpcmf\modules\moduleBase\actions\actionsBase;
use mpcmf\system\pattern\singleton;

/**
 * Class {$data['className']}
 *
{if !empty($entityData['description'])}
 * {$entityData['description']|replace:"\n":"\n * "}
 *
{/if}
 *
 {include file="generator.tpl"}
 *
 * @package {$entityData['moduleNamespace']}\actions;
 * @date {"Y-m-d H:i:s"|date:$entityData['date']}
 *
{foreach from=$entityData['authors'] item='author'}
 * @author {$author['name']} <{$author['email']}>
{/foreach}
 *
 * @method {$entityData['name']}Mapper getMapper
 */
class {$data['className']}
    extends actionsBase
{

    use singleton;

    /**
     * Set options inside this method
     *
     * @return mixed
     */
    public function setOptions()
    {
        // TODO: Implement setOptions() method.
    }

    /**
     * Bind some custom actions
     *
     * @return mixed
     */
    public function bind()
    {
        // TODO: Implement bind() method.
    }
}